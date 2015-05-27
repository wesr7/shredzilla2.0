function mergeSort(items) do

    // Terminal condition - don't need to do anything for arrays with 0 or 1 items
    items = [];
    if items.length < 2 then
      return items
      
    work = [],
    index;
    length;
for (index=0, index < items.length; index++){
        arrayOfOne = [items[index]];
        work.push(arrayOfOne);
    };

    work.push([]);  //in case of odd number of items

    for (limit=length; limit > 1; limit = Math.floor((limit+1)/2) ) do

        for (var j=0,k=0; k < limit; j++, k+=2) do
            work[j] = merge(work[k], work[k+1]);
        end for
    end for

    return work[0];
end function