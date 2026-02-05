import numpy as np
from scipy.spatial.distance import cdist
import cv2


def recurrence_image(
    x,
    m=3,
    tau=2,
    eps=None,
    out_size=128,
    normalize=True
):
    """
    Convert 1D time series to recurrence plot image.

    Parameters
    ----------
    x : np.ndarray
        Shape (N,), e.g. N=750
    m : int
        Embedding dimension
    tau : int
        Time delay
    eps : float or None
        Recurrence threshold. If None, chosen automatically.
    out_size : int
        Output image size (out_size x out_size)
    normalize : bool
        Z-score normalize input signal

    Returns
    -------
    R : np.ndarray
        Recurrence image of shape (out_size, out_size)
    """

    x = np.asarray(x, dtype=np.float32)

    # Normalize per segment
    if normalize:
        x = (x - x.mean()) / (x.std() + 1e-6)

    # Time-delay embedding
    N = len(x)
    T = N - (m - 1) * tau
    if T <= 0:
        raise ValueError("Time series too short for chosen m and tau")

    X = np.empty((T, m), dtype=np.float32)
    for i in range(T):
        X[i] = x[i : i + m * tau : tau]

    # Pairwise distances
    D = cdist(X, X, metric="euclidean")

    # Threshold selection
    if eps is None:
        eps = 0.1 * np.std(D)

    # Recurrence matrix (binary)
    R = (D <= eps).astype(np.float32)

    # Resize for CNN
    R = cv2.resize(R, (out_size, out_size), interpolation=cv2.INTER_AREA)

    return R