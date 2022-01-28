package com.ynov.airbnbynov.viewmodel;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import com.ynov.airbnbynov.bo.City;

import java.util.ArrayList;

public class ListCitiesFragmentViewModel extends ViewModel {

    MutableLiveData<ArrayList<City>> arrayListCity;

    public MutableLiveData<ArrayList<City>> getArrayListCity() {

        if(arrayListCity == null) {
            this.arrayListCity = new MutableLiveData<>(new ArrayList<>());
        }

        return this.arrayListCity;
    }


}
