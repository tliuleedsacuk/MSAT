function test_suite = test_MS_expand
initTestSuite;
end

function test_MS_expand_isotropic

    C_in = [  0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];
          
    C_out = [ 166.6667 66.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 166.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 66.6667 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 50.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];          
          
    assertElementsAlmostEqual(MS_expand(C_in, 'iso'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'auto'), C_out);
    
end

function test_MS_expand_cubic

    C_in = [  0.0 66.6667 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];
          
    C_out = [ 166.6667 66.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 166.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 66.6667 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 50.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];          
          
    assertElementsAlmostEqual(MS_expand(C_in, 'cubic'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'auto'), C_out);
    
end

function test_MS_expand_hexagonal

    C_in = [  166.6667 0.0 66.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];
          
    C_out = [ 166.6667 66.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 166.6667 66.6667 0.0 0.0 0.0 ; ...
              66.6667 66.6667 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 50.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];          
          
    assertElementsAlmostEqual(MS_expand(C_in, 'hex'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'vti'), C_out);
    assertElementsAlmostEqual(MS_expand(C_in, 'auto'), C_out);
    
end

function test_MS_expand_errors


    C_in = [  166.6667 0.0 66.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ];
    f = @()MS_expand(C_in, 'auto');
    assertExceptionThrown(f, 'MS:CHECKCNotMatrix')
    
    C_in = [  166.6667 0.0 66.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 40.0 -2.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ]; 
    f = @()MS_expand(C_in, 'bob');
    assertExceptionThrown(f, 'MS:EXPANDunsupportsymmetry')
    
    C_in = [  166.6667 0.0 66.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 50.0 40.0 -2.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ]; 
    f = @()MS_expand(C_in, 'auto');
    assertExceptionThrown(f, 'MS:EXPANDnoautosym')
    
    C_in = [  0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ];
    f = @()MS_expand(C_in, 'iso');
    assertExceptionThrown(f, 'MS:EXPANDbadiso')
    C_in = [  0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 166.6667 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ; ...
              0.0 0.0 0.0 0.0 0.0 50.0 ; ...
              0.0 0.0 0.0 0.0 0.0 0.0 ];
    f = @()MS_expand(C_in, 'iso');
    assertExceptionThrown(f, 'MS:EXPANDbadiso')
end


