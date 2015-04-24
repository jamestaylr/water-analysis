function [CMASS] = centerOfMass(COMPLEMENT, DATA)

NUMSUM = 0;
DENOSUM = 0;

for i = 1:1:numel(t);
   NUMSUM = COMPLEMENT(i) * DATA(i) + NUMSUM;
   DENOSUM = DATA(i) + DENOSUM;

end

CMASS = NUMSUM / DENOSUM;

