export const isLeap = year => {
  const answer =
    year % 4 !== 0 ||
    (year % 100 === 0 && year % 400 !== 0) ||
    (year % 200 === 0 && year % 400 !== 0)
      ? false
      : true;
  return answer;
};
