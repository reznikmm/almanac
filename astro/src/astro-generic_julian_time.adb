-----------------------------------------------------------------------
-- Astro - Ada library for astronomical calculations.                --
--                                                                   --
--  This package provides abstractions for Julian time.              --
-----------------------------------------------------------------------
--  Copyright (C) 2024 Juan A. de la Puente                          --
--  Distributed under GPL 3.0                                        --
-----------------------------------------------------------------------

package body Astro.Generic_Julian_Time is

   --  Reference : Fliegel & Van Flandern, Comm. ACM. vol. 11, no. 10,
   --              October 1968, pg. 657.
   --  Also in Explanatory Supplement to the Nautical Almanach, 12.9.

   -------------
   -- Date_Of --
   -------------

   function Date_Of
     (D : Positive;
      M : Positive;
      Y : Positive;
      S : Duration) return Date
   is
      JD12H  : Integer;
      JD     : Date;

   begin

      --  Split (T, Y, M, D, S);

      --  Julian date at 12:00 UT
      JD12H :=  1461 * (Y + 4800 + (M - 14) / 12) / 4
        + 367 * (M - 2 - (M - 14) / 12 * 12) / 12
        - 3 * ((Y + 4900 + (M - 14) / 12) / 100) / 4
        + D - 32075;

      --  Julian date at T
      JD := Date (JD12H) + Date (S / 86_400.0) - 0.5;

      return JD;

   end Date_Of;

end Astro.Generic_Julian_Time;
