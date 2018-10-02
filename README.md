# foldchange operator

#### Description
`foldchange` operator performs a fold change (i.e. ratio) caculation between two values.

##### Usage
Input projection|.
---|---
`x-axis`  | contains the grouping factor for the fold change calculation, 
`y-axis` | values

Input parameter|.
---|---
`reverse`  | logical, to reverse the calculation, default is `FALSE`


Output relations|.
---|---
`foldchange`| numeric, calculated per cell

##### Details
A foldchange operation is performed per cell. Each cell has values defined by the y-axis and seperated by the x-axis. The result of the foldchange is the ratio of the first divided by the second. If reverse is selected then the order of the ratio is changed.


#### References

##### See Also
[ratio](https://github.com/tercen/ratio_operator),[logfoldchange](https://github.com/tercen/logfoldchange_operator)
#### Examples




 
 
