package com.ynov.airbnbynov.fragment;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProvider;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ynov.airbnbynov.R;
import com.ynov.airbnbynov.adapter.CityAdapter;
import com.ynov.airbnbynov.bo.City;
import com.ynov.airbnbynov.viewmodel.ListCitiesFragmentViewModel;

import java.io.IOException;
import java.util.ArrayList;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class ListCitiesFragment extends Fragment {

    OkHttpClient client;

    private static final String TAG = "ListeCitiesFragment";

    private CityAdapter adapter;
    private RecyclerView rv;
    private ListCitiesFragmentViewModel vm;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        client = new OkHttpClient();
        vm = new ViewModelProvider(this).get(ListCitiesFragmentViewModel.class);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_list_cities, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        initializeCities();

        Observer<ArrayList<City>> observerList = messages -> {
            adapter.setCityArrayList(messages);
            rv.scrollToPosition(adapter.getItemCount()-1);
        };

        vm.getArrayListCity().observe(getViewLifecycleOwner(),observerList);

        if(vm.getArrayListCity().getValue().isEmpty()) {
            fetchCities();
        }

        super.onViewCreated(view, savedInstanceState);
    }

    public void fetchCities() {
        Request requestMsg = new Request.Builder()
            .url("https://flutter-learning.mooo.com/villes")
            .build();
        client.newCall(requestMsg).enqueue(new Callback() {
            @Override
            public void onFailure(@NonNull Call call, @NonNull IOException e) {
                Log.e(TAG, "onFailure: " + "Erreur lors de la récupération des villes : " + e.getMessage());
            }

            @Override
            public void onResponse(@NonNull Call call, @NonNull Response response) throws IOException {
                if(response.code() == 200) {
                    ArrayList<City> alCities = new Gson().fromJson(
                            response.body().string(),
                            new TypeToken<ArrayList<City>>(){}.getType()
                    );
                    vm.getArrayListCity().postValue(alCities);
                } else {
                    Log.e(TAG, "onResponse: " + "Erreur lors de la récupération des villes" );
                }
            }
        });
    }

    private void initializeCities() {
        rv = getView().findViewById(R.id.recyclerView);

        adapter = new CityAdapter();
        rv.setLayoutManager(new LinearLayoutManager(getContext()));

        rv.setAdapter(adapter);
    }

}