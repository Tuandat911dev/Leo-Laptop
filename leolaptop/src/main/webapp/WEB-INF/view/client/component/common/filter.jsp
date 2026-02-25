<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="additional-product mb-4">
    <h4 class="mb-3">Khoảng Giá</h4>

    <div class="additional-product-item mb-1">
        <input type="radio" class="me-2" id="Price-1" name="priceRange" value="1-toi-2-trieu">
        <label for="Price-1" class="text-dark">Từ 1.000.000 - 2.000.000</label>
    </div>
    <div class="additional-product-item mb-1">
        <input type="radio" class="me-2" id="Price-2" name="priceRange" value="2-toi-3-trieu">
        <label for="Price-2" class="text-dark">Từ 2.000.000 - 3.000.000</label>
    </div>
    <div class="additional-product-item mb-1">
        <input type="radio" class="me-2" id="Price-3" name="priceRange" value="3-toi-4-trieu">
        <label for="Price-3" class="text-dark">Từ 3.000.000 - 4.000.000</label>
    </div>
    <div class="additional-product-item mb-1">
        <input type="radio" class="me-2" id="Price-4" name="priceRange" value="4-toi-5-trieu">
        <label for="Price-4" class="text-dark">Từ 4.000.000 - 5.000.000</label>
    </div>
</div>

<div class="product-tags my-4">
    <h4 class="mb-3">Hãng Sản Xuất</h4>
    <div class="product-tags-items bg-light rounded p-3 d-flex flex-wrap gap-2">
        <a href="javascript:void(0)" data-brand="apple" class="brand-item border rounded py-1 px-2">Apple</a>
        <a href="javascript:void(0)" data-brand="dell" class="brand-item border rounded py-1 px-2">Dell</a>
        <a href="javascript:void(0)" data-brand="asus" class="brand-item border rounded py-1 px-2">Asus</a>
        <a href="javascript:void(0)" data-brand="lg" class="brand-item border rounded py-1 px-2">LG</a>
        <a href="javascript:void(0)" data-brand="acer" class="brand-item border rounded py-1 px-2">Acer</a>
        <a href="javascript:void(0)" data-brand="lenovo" class="brand-item border rounded py-1 px-2">Lenovo</a>
        <a href="javascript:void(0)" data-brand="hp" class="brand-item border rounded py-1 px-2">HP</a>
        <a href="javascript:void(0)" data-brand="msi" class="brand-item border rounded py-1 px-2">MSI</a>
    </div>
</div>

<div class="target-tags my-4">
    <h4 class="mb-3">Nhu Cầu Sử Dụng</h4>
    <div class="target-tags-items bg-light rounded p-3 d-flex flex-wrap gap-2">
        <a href="javascript:void(0)" data-target="gaming" class="target-item border rounded py-1 px-2">Gaming</a>
        <a href="javascript:void(0)" data-target="văn phòng" class="target-item border rounded py-1 px-2">Văn phòng</a>
        <a href="javascript:void(0)" data-target="lập trình" class="target-item border rounded py-1 px-2">Lập trình</a>
        <a href="javascript:void(0)" data-target="đồ hoạ" class="target-item border rounded py-1 px-2">Đồ hoạ</a>
    </div>
</div>

<div class="d-flex justify-content-center my-4">
    <button type="button" class="btn btn-primary px-4 py-3 rounded-pill w-100 searchBtnFilter">Tìm kiếm</button>
</div>

<div class="d-flex justify-content-center my-4">
    <a href="/shop?page=1" class="btn btn-secondary px-4 py-3 rounded-pill w-100">Xoá bộ lọc</a>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const brandItems = document.querySelectorAll('.brand-item');
        const targetItems = document.querySelectorAll('.target-item');
        const prices = document.querySelectorAll('input[name="priceRange"]');
        const params = new URLSearchParams(window.location.search);

        // display selected option
        const selectedBrandsFromUrl = params.get('factory') ? params.get('factory').split(',') : [];
        const selectedTargetsFromUrl = params.get('target') ? params.get('target').split(',') : [];
        const selectedPrice = params.get('price') ?? '';

        prices.forEach(item => {
            if (item.value === selectedPrice) {
                item.checked = true;
            }
        })

        brandItems.forEach(item => {
            if (selectedBrandsFromUrl.includes(item.getAttribute('data-brand'))) {
                item.classList.add('bg-primary', 'text-white');
            }

            item.addEventListener('click', function () {
                this.classList.toggle('bg-primary');
                this.classList.toggle('text-white');
            });
        });

        targetItems.forEach(item => {
            if (selectedTargetsFromUrl.includes(item.getAttribute('data-target'))) {
                item.classList.add('bg-primary', 'text-white');
            }

            item.addEventListener('click', function () {
                this.classList.toggle('bg-primary');
                this.classList.toggle('text-white');
            });


        });

        // handle submit btn
        document.querySelector('.searchBtnFilter').addEventListener('click', function () {
            const selectedRadio = document.querySelector('input[name="priceRange"]:checked');

            const selectedBrands = [];
            const selectedTargets = [];

            document.querySelectorAll('.brand-item.bg-primary').forEach(item => {
                selectedBrands.push(item.getAttribute('data-brand'));
            });

            document.querySelectorAll('.target-item.bg-primary').forEach(item => {
                selectedTargets.push(item.getAttribute('data-target'));
            });

            // update url

            if (selectedBrands.length > 0) {
                params.set('factory', selectedBrands.join(','));
            } else {
                params.delete('factory');
            }

            if (selectedTargets.length > 0) {
                params.set('target', selectedTargets.join(','));
            } else {
                params.delete('target');
            }

            if (selectedRadio) {
                params.set('price', selectedRadio.value);
            } else {
                params.delete('price');
            }

            window.location.href = window.location.pathname + '?' + params.toString();
        });
    });
</script>
