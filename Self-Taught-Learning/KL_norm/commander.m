function commander
fid=fopen('result_KL.txt','wt');
%ranges=[0.01,0.02,0.03,0.04,0.050.06,0.07,0.08,0.09,0.10,,0.2,0.3,0.4,0.5,1,2,3,4,5];
ranges=0.01:0.01:5;
for i=1:length(ranges),
    [sparse,reconstructError,testAccuracy]=stlExercise(ranges(i))
    fprintf(fid,'beta:\t%f\t sparse:\t%f\t reconstructError:\t%f\t testAccuracy:\t%f\n',ranges(i),sparse,reconstructError,testAccuracy);
end
