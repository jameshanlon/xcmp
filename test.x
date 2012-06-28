val ct_eom = 1;

chan tree;       
chan codebuffer;
chan labval;     

val tree_len = 70000;
val codebuffer_len = 20000;
val labval_len = 4000;

proc main() is
  var v;
  var i;
{ i := 0;
  while (i < tree_len) do
  { tree[i] := i;
    i := i + 1
  };
  i := 0;
  while (i < tree_len) do
  { v := tree[i];
    i := i + 1
  };
  i := 0;
  while (i < codebuffer_len) do
  { codebuffer[i] := i;
    i := i + 1000
  };
  i := 0;
  while (i < codebuffer_len) do
  { v := codebuffer[i];
    i := i + 1
  };
  i := 0;
  while (i < labval_len) do
  { labval[i] := i;
    i := i + 1
  };
  i := 0;
  while (i < labval_len) do
  { v := labval[i];
    i := i + 1
  };
  tree !! ct_eom
}

