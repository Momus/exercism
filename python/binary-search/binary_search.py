'''simple binary search implementation'''

def find(search_list: list[int], value: int) -> int:
    '''Find a  value in an array and return position if present
    
    Parameters:
         search_list: list of integers to be searched sorted in ascending
                      order
         value: an integer to be found in the list

    Returns:
          integer corresponding to the location in the array if found.
          Raise ValueError if not found.
    '''
    left, right = 0, len(search_list) - 1

    while left <= right:
        mid = (right + left) // 2
        mid_val = search_list[mid]
        if mid_val == value:
            return mid
        if value < mid_val:
            right = mid - 1
        else:
            left = mid + 1

    raise ValueError("value not in array")
