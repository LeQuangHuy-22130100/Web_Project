document.addEventListener('DOMContentLoaded', function() {
    const products = [

            { "id": 1, "name": "SOFA DA THẬT FANTASIA FE27", "price": "290.000.000 VND", "description": "Sofa chất liệu da, màu xám.", "image": "/sofa_a.jpg" },
            { "id": 2, "name": "SOFA DA THẬT AGAY EE27", "price": "244.000.000 VND", "description": "Sofa chất liệu da, màu xám.", "image": "/sofa_b.jpg" },
            { "id": 3, "name": "SOFA DA THẬT BROADWAY 16777", "price": "290.000.000 VND", "description": "Sofa chất liệu da, màu đen.", "image": "/sofa_c.jpg" },
            { "id": 4, "name": "SOFA DA THẬT CLOUD F040", "price": "237.000.000 VND", "description": "Sofa chất liệu da, màu xanh lá.", "image": "/sofa_d.jpg" },
            { "id": 5, "name": "SOFA DA THẬT CASA F050", "price": "168.000.000 VND", "description": "Sofa chất liệu da, màu nâu.", "image": "/sofa_e.jpg" },
            { "id": 6, "name": "SOFA DA THẬT FLUSSO F049", "price": "275.000.000 VND", "description": "Sofa chất liệu da, màu xanh dương.", "image": "/sofa_f.jpg" },
            { "id": 7, "name": "SOFA DA THẬT FLUSSO F049", "price": "176.000.000 VND", "description": "Sofa chất liệu da, màu cam.", "image": "/sofa_1.jpg" },
            { "id": 8, "name": "SOFA DA THẬT LARVA – FE32", "price": "173.000.000 VND", "description": "Sofa chất liệu da, màu cam.", "image": "/sofa_2.jpg" },
            { "id": 9, "name": "SOFA DA THẬT PEACE F054", "price": "106.000.000 VND", "description": "Sofa chất liệu da, màu cam.", "image": "/sofa_3.jpg" },
            { "id": 10, "name": "SOFA DA THẬT TIRAMISU – FM33", "price": "180.000.000 VND", "description": "Sofa chất liệu da, màu cam và đen.", "image": "/sofa_4.jpg" },
            { "id": 11, "name": "SOFA DA THẬT FIORE FE19", "price": "368.000.000 VND", "description": "Sofa chất liệu da, màu nâu.", "image": "/sofa_5.jpg" },
            { "id": 12, "name": "SOFA DA THẬT LEAP F029", "price": "243.000.000 VND", "description": "Sofa chất liệu da, màu nâu.", "image": "/sofa_6.jpg" },
            { "id": 13, "name": "SOFA DA THẬT BARISTA F028", "price": "196.000.000 VND", "description": "Sofa chất liệu da, màu nâu.", "image": "/sofa_7.jpg" },
            { "id": 14, "name": "SOFA DA THẬT DELICATO F032", "price": "359.000.000 VND", "description": "Sofa chất liệu da, màu cam.", "image": "/sofa8.jpg" },
            { "id": 15, "name": "SOFA DA THẬT ESTEREL EE87", "price": "273.000.000 VND", "description": "Sofa chất liệu da, màu cam.", "image": "/sofa9.jpg" },
            { "id": 16, "name": "SOFA DA THẬT AVENUE 3814", "price": "340.000.000 VND", "description": "Sofa chất liệu da, màu nâu.", "image": "/sofa10.jpg" },
            { "id": 17, "name": "SOFA DA THẬT BELLAGIO 957E", "price": "168.000.000 VND", "description": "Sofa chất liệu da, màu đen.", "image": "/sofa11.jpg" },
            { "id": 18, "name": "SOFA DA THẬT 386E – GLORIA", "price": "255.000.000 VND", "description": "Sofa chất liệu da, màu trắng.", "image": "/sofa12.jpg" },
            { "id": 19, "name": "SOFA DA THẬT ARTIS 4080", "price": "255.000.000 VND", "description": "Sofa chất liệu da, màu đen.", "image": "/sofa13.jpg" },
            { "id": 20, "name": "SOFA DA THẬT DORIAN 2253", "price": "162.000.000 VND", "description": "Sofa chất liệu da, màu đen.", "image": "/sofa14.jpg" },
            { "id": 21, "name": "SOFA DA THẬT LAMBERT 38A1", "price": "350.000.000 VND", "description": "Sofa chất liệu da, màu đen.", "image": "/sofa15.jpg" },
            { "id": 22, "name": "SOFA DA THẬT ROADSTER 382P", "price": "100.000.000 VND", "description": "Sofa chất liệu da, màu trắng.", "image": "/sofa16.jpg" },
            { "id": 23, "name": "SOFA DA THẬT FINN 20974", "price": "290.000.000 VND", "description": "Sofa chất liệu da, màu nâu.", "image": "/sofa17.jpg" },
            { "id": 24, "name": "SOFA DA THẬT SALLY 15350", "price": "233.000.000 VND", "description": "Sofa chất liệu da, màu đen.", "image": "/sofa18.jpg" }


    ];

    const productContainer = document.getElementById('products');

    products.forEach(product => {
        const productElement = document.createElement('div');
        productElement.className = 'product';

        productElement.innerHTML = `
            <a href="/HTML/product_detail.html?id=${product.id}">
                <img src="/IMG/${product.image}" alt="${product.name}">
                <h2>${product.name}</h2>
                <p><strong>Price:</strong> ${product.price}</p>
                <p>${product.category}</p>
            </a>
        `;

        productContainer.appendChild(productElement);
    });
});
