module PagesHelper
  def get_first_n(n, array)
    if array.size > n
      array[0..n-1]
    else
      array[0..array.size]
    end
  end
end
