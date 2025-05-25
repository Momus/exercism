'''simple binary search implementation'''

def find(search_list, value, left=0, right=None):
    '''find a  value in an array and return position if present'''
    if not search_list:
        raise ValueError("value not in array")
    if not right:
        right = len(search_list) - 1
    mid = ((right - left) // 2) + left
    if search_list[mid] == value:
        return mid
    if search_list[mid + 1] == value:
        return mid + 1
    if right - left in (0,1):
        raise ValueError("value not in array")
    if search_list[mid] < value:
        left = mid
    else:
        right = mid
    return find(search_list, value, left, right)
