int main(){
    struct test {
        int d;
    };
    int n;
    cout<< "Please enter n:";
    cin>> n;
    if(n<0)
    {
      cout<< "Please enter a natural number";
    }
    while(n>0)
    {
      if(n%2==1)
      {
        cout<<n;
      }
      n = n-1;
    }
}
