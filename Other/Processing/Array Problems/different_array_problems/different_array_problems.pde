int[] nums={5, 4, 2, 7, 6, 8, 5, 2, 8, 14};

//Problem #1:
//square each number
//for (int i=0; i<nums.length; i++) {
//  nums[i] *= nums[i];
//  println(nums[i]);
//}

//Problem #2:
//add random number between zero and 10 to each number
//for (int i=0; i<nums.length; i++) {
//  nums[i] += int(random(11));
//  println(nums[i]);
//}

//Problem #3:
//add to each # the # that follows in the array. skip last value in array
//for (int i=0; i<nums.length-1; i++) {
//  nums[i] += nums[i+1];
//  println(nums[i]);
//}

//Problem #4:
//calculate the sum of all the numbers
int sum = 0;
for (int i=0; i<nums.length; i++) {
  sum += nums[i];
}
println(sum);