'''simple binary search implementation'''

def find(search_list, value):
    '''find a  value in an array and return the position'''
    def r_find(search_list, value, left, right):
        mid = ((right - left) // 2) + left
        print("mid=", mid, " right=", right, " left=", left)
        if not search_list:
            raise ValueError("value not in array")
        if search_list[mid] == value:
            return mid
        if search_list[mid + 1] == value:
            return mid +1
        if (right - left) in (0,1):
            raise ValueError("value not in array")
        if search_list[mid] < value:
            left = mid
            print("righ:", right)
        else:
            right = mid
            print("left:", left)
        return r_find(search_list, value, left, right)
    
    return r_find(search_list, value, 0, len(search_list) -1)
