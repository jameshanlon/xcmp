%port instream      : 0;
%port messagestream : 0;
%port binstream     : (8<<16) or (2 << 8);

val ct_eom = 1;

chan tree;       
chan labval;     
chan codebuffer;

val tree_len = 70000;
val labval_len = 4000;
val codebuffer_len = 20000;

val increment = 1000;

%var outstream;
%
%proc putval(val c) is outstream ! c
%proc selectoutput(val c) is outstream := c

proc main() is
  var v;
  var i;
{ i := 0;
  while (i < tree_len) do
  { tree[i] := i;
    i := i + increment
  };
  i := 0;
  while (i < tree_len) do
  { v := tree[i];
    i := i + increment
  };
  i := 0;
  while (i < labval_len) do
  { labval[i] := i;
    i := i + increment
  };
  i := 0;
  while (i < labval_len) do
  { v := labval[i];
    i := i + increment
  };
  i := 0;
  while (i < codebuffer_len) do
  { codebuffer[i] := i;
    i := i + increment
  };
  i := 0;
  while (i < codebuffer_len) do
  { v := codebuffer[i];
    i := i + increment
  };
  tree !! ct_eom
  %selectoutput(messagestream);
  %putval(0);
  %selectoutput(binstream)
  %binstream ! 0
}

