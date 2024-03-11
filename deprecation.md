<style>
r { color: Red }
g { color: Green }
</style>

| Version | printf size specifiers | malloc(0) works |
|---------|------------------------|-----------------|
| latest  | <g>Included</g> | <g>Does not work</g> |
| depr-c1 | <r>Not Included</r> (uses 64bit) | <r>Can break</r> (if implemented) |