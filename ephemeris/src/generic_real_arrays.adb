with Ada.Numerics.Generic_Elementary_Functions;

package body Generic_Real_Arrays is

   package Elementary_Functions is new Ada.Numerics.Generic_Elementary_Functions (Real'Base);

   function "*" (Left, Right : Real_Vector) return Real'Base is
      R : Real'Base := 0.0;
   begin
      for J in Left'Range loop
         R := R + Left (J) * Right (J - Left'First + Right'First);
      end loop;

      return R;
   end "*";

   function "*" (Left : Real_Vector; Right : Real'Base) return Real_Vector is
      R : Real_Vector (Left'Range);
   begin
      for J in Left'Range loop
         R (J) := Left (J) * Right;
      end loop;
      return R;
   end "*";

   function "*" (Left : Real'Base;   Right : Real_Vector) return Real_Vector is
     (Right * Left);

   function "*" (Left : Real_Matrix; Right : Real_Vector) return Real_Vector is
      R : Real_Vector (Right'Range) := (others => 0.0);
   begin
      for J in Left'Range (1) loop
         for K in Left'Range (2) loop
            R (J) := R (J) + Left (J, K) * Right (K);
         end loop;
      end loop;

      return R;
   end "*";

   function "/" (Left : Real_Vector; Right : Real'Base) return Real_Vector is
      R : Real_Vector (Left'Range);
   begin
      for J in Left'Range loop
         R (J) := Left (J) / Right;
      end loop;
      return R;
   end "/";

   function "+" (Left, Right : Real_Vector) return Real_Vector is
      R : Real_Vector (Left'Range);
   begin
      for J in Left'Range loop
         R (J) := Left (J) + Right (J);
      end loop;
      return R;
   end "+";

   function "-" (Left, Right : Real_Vector) return Real_Vector is
      R : Real_Vector (Left'Range);
   begin
      for J in Left'Range loop
         R (J) := Left (J) - Right (J);
      end loop;
      return R;
   end "-";

   function "abs" (Right : Real_Vector) return Real'Base is
     (Elementary_Functions.Sqrt (Right * Right));

end Generic_Real_Arrays;
