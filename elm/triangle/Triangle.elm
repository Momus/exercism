module Triangle (..) where


--First make sure it's a triangle, then compute the kind.
triangleKind : number -> number' -> number'' -> Result String String
triangleKind a b c =
  if ((a <= 0) || (b <= 0) || (c <= 0)) then
    Err "Invalid lengths"
  else if (2 * (max a (max b c))) >= (a + (b + c)) then
    Err "Violates inequality"
  else
    computeTriangleKind a b c


computeTriangleKind : number -> number -> number -> Result b String
computeTriangleKind a b c =
  if ((a == b) && (b == c)) then
    Ok "equilateral"
  else if ((a == b) || (a == c) || (b == c)) then
    Ok "isosceles"
  else
    Ok "scalene"