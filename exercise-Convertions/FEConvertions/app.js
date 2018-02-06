var myapp = angular.module('myapp', []);

myapp.controller('MainCtrl', ['$scope', '$filter', '$interval','CurrencyConverterService', function ($scope,  $filter, $interval  , CurrencyConverterService) {  
	var change;
	$scope.rates = [];
  $scope.userLogged = false;
  $scope.error=false;

  $scope.login= function(username, password){
    $scope.errorMsg="";
    $scope.error=false;
    CurrencyConverterService.login( username,  password).then(function(response){
      if(response.data.username){
            $scope.userLogged = true;
      }else{
        $scope.error=true;
        $scope.errorMsg=response.data.errorMsg;
      }
    })
  }; 

  var getRateEUR = function (){
    CurrencyConverterService.getRateEUR().then(function(response){
     if(response.data) change = response.data.rates.EUR;
    })
  };


	var getRates= function(){
      CurrencyConverterService.getRates().then(function(response){

        if(response.data){
            var rates= response.data;
            angular.forEach(rates.rates, function(value, key) {
              var rate ={
                coin:'',
                value:''
              };
              rate.coin= key;
              rate.value = value;
              this.push(rate);
            },$scope.rates);
        }
      })
  };
  getRateEUR();
  getRates();
  $interval(getRateEUR, 10 * 600000);
  $interval(getRates, 10 * 600000);

	$scope.changeEuro = function (dolar){
			var euroValue = dolar*change; 
			$scope.euroValue = $filter('currency')(euroValue, 'EUR ');
	}


}]);

  myapp.service('CurrencyConverterService',  function($http, $q ) {
    //UPDATE ROUTE IF NECESSARY
    return({
        getRates: function(){
            var base= "USD";
            var route =  "http://localhost:8080"+"/currencyConverter/rest/change/"+base;
            return $http({
              url:route,
              method: "GET",
              params: {base: base}
             });
        },
        getRateEUR: function(){
          var base= "USD";
          var symbols = "EUR"
          var route =  "http://localhost:8080"+"/currencyConverter/rest/change/"+base+"/"+symbols;
              return $http({
                url:route,
                method: "GET",
                params: {base: base, symbols: symbols}
               });
        },
        login: function(username, password){
            var route =  "http://localhost:8080/currencyConverter/rest/authenticate/login";
            return $http({
                url:route,
                method: "POST",
                data: {username: username, password: password},
                contentType: 'application/json',
               });
        }
    });
});