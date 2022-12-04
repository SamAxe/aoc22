import std;

int main( )
{
  auto file = File( "input" );

  long extra = 0;
  foreach( line; file.byLine )
  {
    // 75-76,18-75
    auto m = line.matchFirst( `(\d+)-(\d+),(\d+)-(\d+)` );

    auto low_1  = m[1].to!int;
    auto high_1 = m[2].to!int;
    auto low_2  = m[3].to!int;
    auto high_2 = m[4].to!int;

    if ( low_1 >= low_2 && high_1 <= high_2 )
    {
      writefln( "#1 %s", line );
      extra++;
    }
    else if ( low_2 >= low_1 && high_2 <= high_1 )
    {
      writefln( "#2 %s", line );
      extra++;
    }
  }

  writefln( "Extras are %s", extra );

  return 0;
}
