with Ada.Text_IO;
with Astro.Generic_Coordinates.Horizontal;
with Astro.Generic_Solar_System;
with Ephemeris;

procedure STM32_Demo is
   package Solar_System is new Astro.Generic_Solar_System (Long_Long_Float);

   package Horizontal is new Solar_System.Coordinates.Horizontal;
   package Equatorial renames Horizontal.Equatorial;

   Date : constant Solar_System.Julian.Date :=
     Solar_System.Julian.Date_Of
       (D => 24, M => 07, Y => 2025, S => 2 * 60 * 60.0);

   Place : constant Solar_System.Geographic.Geographic_Coordinates :=
     (Latitude  => 47.0,
      Longitude => 35.0);

   C : Solar_System.Spheric.Spherical_Coordinates;
   E : Equatorial.Equatorial_Coordinates;
   H : Horizontal.Horizontal_Coordinates;

begin
   C := Solar_System.Topocentric_Place
     (Target   => Ephemeris.Sun,
      JTD      => Date,
      Position => Place,
      Height   => 20.0);

   Ada.Text_IO.Put ("Right_Ascension ");
   Ada.Text_IO.Put (C.Right_Ascension'Image);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put ("Declination ");
   Ada.Text_IO.Put (C.Declination'Image);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put ("Distance ");
   Ada.Text_IO.Put (C.Distance'Image);
   Ada.Text_IO.New_Line;

   declare
      GHA  : constant Solar_System.Coordinates.Degrees :=
        Solar_System.Spheric.GHA (C.Right_Ascension, Date);

   begin
      E :=
        (Declination => C.Declination,
         Hour_Angle  => Equatorial.LHA (GHA, Place.Longitude));

      H := Horizontal.Horizontal (E, (Place.Latitude, Place.Longitude));

      Ada.Text_IO.Put ("Azimuth ");
      Ada.Text_IO.Put (H.Azimuth'Image);
      Ada.Text_IO.New_Line;

      Ada.Text_IO.Put ("Altitude ");
      Ada.Text_IO.Put (H.Altitude'Image);
      Ada.Text_IO.New_Line;
   end;
end STM32_Demo;
