package com.example.asm.Respository;

import com.example.asm.Model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRespository extends JpaRepository<SanPham, Integer> {
    List<SanPham> findAllByOrderByNgayTaoDesc();

    SanPham findAllById(Integer id);
}
