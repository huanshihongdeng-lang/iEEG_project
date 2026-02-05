# 5-1-1 setting
class ExpSettings_MAYO(object):
    def __init__(self):
        group1 = [0, 18, 21]
        group2 = [1, 9, 19]
        group3 = [2, 5, 16]
        group4 = [3, 4, 23]
        group5 = [6, 8]
        group6 = [14, 17, 20]
        self.exps = {
            1: {'source': group1 + group2 + group3 + group4,
                'valid': group5,
                'target': group6
                },
            2: {'source': group1 + group2 + group3 + group6,
                'valid': group4,
                'target': group5
                },
            3: {'source': group1 + group2 + group5 + group6,
                'valid': group3,
                'target': group4
                },
            4: {'source': group1 + group4 + group5 + group6,
                'valid': group2,
                'target': group3
                },
            5: {'source': group3 + group4 + group5 + group6,
                'valid': group1,
                'target': group2
                },
            6: {'source': group2 + group3 + group4 + group5,
                'valid': group6,
                'target': group1
                },
        }


class EXPSettings_SWEC(object):
    def __init__(self):
        self.patients = [3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 16, 18]
        
        self.exps = {
            1: {
                'target': [3],
                'valid':  [4],
                'source': [5, 6, 7, 8, 9, 10, 12, 13, 14, 16, 18]
            },
            2: {
                'target': [4],
                'valid':  [5],
                'source': [3, 6, 7, 8, 9, 10, 12, 13, 14, 16, 18]
            },
            3: {
                'target': [5],
                'valid':  [6],
                'source': [3, 4, 7, 8, 9, 10, 12, 13, 14, 16, 18]
            },
            4: {
                'target': [6],
                'valid':  [7],
                'source': [3, 4, 5, 8, 9, 10, 12, 13, 14, 16, 18]
            },
            5: {
                'target': [7],
                'valid':  [8],
                'source': [3, 4, 5, 6, 9, 10, 12, 13, 14, 16, 18]
            },
            6: {
                'target': [8],
                'valid':  [9],
                'source': [3, 4, 5, 6, 7, 10, 12, 13, 14, 16, 18]
            },
            7: {
                'target': [9],
                'valid':  [10],
                'source': [3, 4, 5, 6, 7, 8, 12, 13, 14, 16, 18]
            },
            8: {
                'target': [10],
                'valid':  [12],
                'source': [3, 4, 5, 6, 7, 8, 9, 13, 14, 16, 18]
            },
            9: {
                'target': [12],
                'valid':  [13],
                'source': [3, 4, 5, 6, 7, 8, 9, 10, 14, 16, 18]
            },
            10: {
                'target': [13],
                'valid':  [14],
                'source': [3, 4, 5, 6, 7, 8, 9, 10, 12, 16, 18]
            },
            11: {
                'target': [14],
                'valid':  [16],
                'source': [3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 18]
            },
            12: {
                'target': [16],
                'valid':  [18],
                'source': [3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14]
            },
            13: {
                'target': [18],
                'valid':  [3],
                'source': [4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 16]
            },

        }
        
            


class ExpSettings_FNUSA(object):
    def __init__(self):
        group1 = [1, 5]
        group2 = [2, 12]
        group3 = [3, 4]
        group4 = [6, 7]
        group5 = [8, 10]
        group6 = [11, 13]
        self.exps = {
            1: {'source': group1 + group2 + group3 + group4,
                'valid': group5,
                'target': group6
                },
            2: {'source': group1 + group2 + group3 + group6,
                'valid': group4,
                'target': group5
                },
            3: {'source': group1 + group2 + group5 + group6,
                'valid': group3,
                'target': group4
                },
            4: {'source': group1 + group4 + group5 + group6,
                'valid': group2,
                'target': group3
                },
            5: {'source': group3 + group4 + group5 + group6,
                'valid': group1,
                'target': group2
                },
            6: {'source': group2 + group3 + group4 + group5,
                'valid': group6,
                'target': group1
                },
        }


if __name__ == '__main__':
    arr = [[0, 18, 21], [1, 9, 19], [2, 5, 16], [3, 4, 23], [6, 7, 8], [14, 17, 20]]
