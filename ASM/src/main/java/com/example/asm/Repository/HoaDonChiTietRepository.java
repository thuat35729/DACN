package com.example.asm.Repository;

import com.example.asm.Model.HoaDon;
import com.example.asm.Model.HoaDonCT;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonCT, Integer> {
    List<HoaDonCT> findHoaDonCTById_hoaDon(Integer id);
}
