generic
   type Real is digits <>;
package Generic_Real_Arrays is
   pragma Pure (Generic_Real_Arrays);

   type Real_Vector is array (Integer range <>) of Real'Base;
   type Real_Matrix is array (Integer range <>, Integer range <>) of Real'Base;

   function "*" (Left, Right : Real_Vector) return Real'Base;
   function "*" (Left : Real_Vector; Right : Real'Base) return Real_Vector;
   function "*" (Left : Real'Base;   Right : Real_Vector) return Real_Vector;
   function "/" (Left : Real_Vector; Right : Real'Base) return Real_Vector;
   function "+" (Left, Right : Real_Vector) return Real_Vector;
   function "-" (Left, Right : Real_Vector) return Real_Vector;
   function "abs" (Right : Real_Vector)       return Real'Base;
   function "*" (Left : Real_Matrix; Right : Real_Vector) return Real_Vector;
end Generic_Real_Arrays;