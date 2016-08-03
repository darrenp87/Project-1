draw = function (drinkTotal, startTotal, mainTotal, dessertTotal) {
    CanvasJS.addColorSet("customColours",
        [
            "#009688",
            "#35a79c",
            "#54b2a9",
            "#65c3ba"
        ]);

    var chart = new CanvasJS.Chart("chartContainer", 
        {
            backgroundColor: null,
            animationEnabled: true,
            animationDuration: 1500,

            colorSet: "customColours",

            title: {
                fontFamily: "Segoe UI",
                fontColor: "black",
                text: "Meal Breakdown",
            },

            data: [
        {
            indexLabelFontFamily: "Segoe UI",
            indexLabelFontColor: "black",
            indexLabelFontWeight: "bold",
            type: "pie",
            dataPoints: [
                    { label: "Drink", y: drinkTotal },
                    { label: "Starter", y: startTotal },
                    { label: "Main", y: mainTotal },
                    { label: "Dessert", y: dessertTotal },
            ]
        }
            ]
        });

    chart.render();
}