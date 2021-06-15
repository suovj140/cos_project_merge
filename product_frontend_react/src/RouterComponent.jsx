import React from 'react'
import {BrowserRouter, Route, Switch} from 'react-router-dom';
import ProductListCategoryComponent from "./ProductListComponent/product/ProductListCategoryComponent";
import ProductListSearchComponent from "./ProductListComponent/product/ProductListSearchComponent";
import ProductDetailComponent from "./ProductListComponent/product/Product_Info_Component";
import MainComponent from "./Maincomponent/Main";
import ProductListAccessoryComponent from "./ProductListComponent/product/ProductListAccessoryComponent";
import ProductNewArrivalsComponent from "./ProductListComponent/product/ProductNewArrivalsComponent";
import MYCOSPage from './MYCOSComponent/MYCOSPage';

const AppRouter = () => {
    return(
        <div style={style} >
            <BrowserRouter >
                    <Switch >
                        {/* 메인 페이지 */}
                        <Route exact path="/" component={MainComponent} />

                        {/* 상품 리스트 페이지 */}
                        <Route path="/product-list" component={ProductListCategoryComponent} />
                        <Route path="/product-detail" component={ProductDetailComponent} />
                        <Route path="/search-keyword" component={ProductListSearchComponent} />
                        <Route path="/accessories-list" component={ProductListAccessoryComponent} />
                        <Route path="/new-arrivals" component={ProductNewArrivalsComponent} />
                        {/* <Route path="/mycos-member" component={MyCosMemberComponent} /> */}

                        {/* MYCOS 페이지 */}
                        <Route path="/mycos-member" component={MYCOSPage} />
                    </Switch>
            </BrowserRouter>
        </div>
    );
}

const style = {
    marginTop: '20px'
}

export default AppRouter;