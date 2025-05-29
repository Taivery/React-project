
import React, { useState } from 'react';
import './App.css';
import logo from './image/logo.png';
import telefon from './image/telefon.jpg';
import kurtka from './image/kurtka.jpeg';
import vacuum from './image/dayson.png';
import barbie from './image/Barbi.jpg';
import book1984 from './image/dj.jpg';
import tv from './image/LG.jpg';
import coat from './image/palto.jpg';
import microwave from './image/Samsung.jpg';
import lego from './image/starwars.jpg';
import gone from './image/Vetrom.jpg';
import YandexMap from './YandexMap';

;


function AboutPage() {
  return (
    <div className="about-page">
      <h2>О нас</h2>
      <p>Добро пожаловать на наш маркетплейс — <strong>EasyBuy!</strong></p>
      <p>Наша цель — предоставить пользователям удобный интерфейс для покупки и продажи товаров. Мы стремимся сделать онлайн-шопинг доступным, понятным и приятным.</p>
      <p><strong>Электронная почта:</strong> support@marketplace.com</p>
      <p><strong>Телефон:</strong> +7 (999) 123-45-67</p>
      <p><strong>Адрес:</strong> г. Москва, ул. Пушкина, д.1</p>
    </div>
  );
}

function FAQPage() {
  return (
    <div className="faq-page">
      <h2><strong>Часто задаваемые вопросы</strong></h2>

      <h3><strong>Как оформить заказ?</strong></h3>
      <p>Выберите товар из каталога, добавьте его в корзину и нажмите кнопку "Оформить заказ". Далее укажите способ доставки и оплаты, затем подтвердите заказ.</p>

      <h3><strong>Сколько идет доставка?</strong></h3>
      <p>Срок доставки зависит от вашего региона. Обычно курьерская доставка занимает от 2 до 5 рабочих дней. Самовывоз доступен в тот же или на следующий день.</p>

      <h3><strong>Как отменить заказ?</strong></h3>
      <p>Если вы ещё не подтвердили заказ — просто очистите корзину. Если заказ уже оформлен, свяжитесь с нашей службой поддержки по email или телефону, указанному в разделе "О нас".</p>
    </div>
  );
}

function ProductPage({ product, onBack, onAddToCart }) {
  return (
    <div className="product-page">
      <div className="product-card">
        <img src={product.image} alt={product.name} className="product-card-image" />
        <div className="product-details">
          <h3>{product.name}</h3>
          <p>{product.description}</p>
          <p className="product-price"><strong>{product.price.toLocaleString()} ₽</strong></p>
          <div className="buttons">
            <button className="add-button" onClick={() => onAddToCart(product)}>В корзину</button>
            <button className="back-button" onClick={onBack}>Назад</button>
          </div>
        </div>
      </div>
    </div>
  );
}

function TrackingPage({ orders = [] }) {
  return (
    <div className="tracking-page">
      <h2>Ваши товары</h2>
      {orders.length > 0 ? (
        orders.map((item, idx) => (
          <div key={idx} className="tracking-card">
            <div className="tracking-image-placeholder">📦</div>
            <div className="tracking-info">
              <div className="tracking-name">{item.name}</div>
              <div className="tracking-status">Статус: <span className="tracking-progress">в пути</span></div>
            </div>
          </div>
        ))
      ) : (
        <p>Нет активных заказов</p>
      )}
    </div>
  );
}

const categories = ['Все', 'Электроника', 'Одежда', 'Дом', 'Игрушки', 'Книги'];

const products = [
  { id: 1, name: 'Смартфон Samsung Galaxy S21', category: 'Электроника', price: 59990, image: telefon, description: 'Мощный смартфон с AMOLED-дисплеем.' },
  { id: 2, name: 'Куртка зимняя мужская', category: 'Одежда', price: 9990, image: kurtka, description: 'Теплая зимняя куртка.' },
  { id: 3, name: 'Пылесос Dyson V11', category: 'Дом', price: 34990, image: vacuum, description: 'Беспроводной пылесос Dyson.' },
  { id: 4, name: 'Кукла Барби', category: 'Игрушки', price: 1990, image: barbie, description: 'Классическая кукла Барби.' },
  { id: 5, name: 'Книга "1984"', category: 'Книги', price: 790, image: book1984, description: 'Антиутопия Дж. Оруэлла.' },
  { id: 6, name: 'Телевизор LG OLED', category: 'Электроника', price: 109990, image: tv, description: 'Современный OLED-телевизор LG.' },
  { id: 7, name: 'Пальто женское', category: 'Одежда', price: 12990, image: coat, description: 'Классическое пальто на осень.' },
  { id: 8, name: 'Микроволновка Samsung', category: 'Дом', price: 8990, image: microwave, description: 'Микроволновая печь Samsung.' },
  { id: 9, name: 'Лего Star Wars', category: 'Игрушки', price: 7490, image: lego, description: 'Набор Лего по Star Wars.' },
  { id: 10, name: 'Книга "Унесенные ветром"', category: 'Книги', price: 950, image: gone, description: 'Исторический роман.' }
];


const showProduct = (product) => {
    setSelectedProduct(product);
    setPage('product');
  };

function AuthPage({ onLogin, onSwitch }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  return (
    <div className="auth-page">
      <h2>Авторизация</h2>
      <input placeholder="Email" value={email} onChange={e => setEmail(e.target.value)} />
      <input placeholder="Пароль" type="password" value={password} onChange={e => setPassword(e.target.value)} />
      <button onClick={() => onLogin(email)}>Войти</button>
      <p>Нет аккаунта? <button onClick={onSwitch}>Зарегистрироваться</button></p>
    </div>
  );
}

function RegisterPage({ onRegister, onSwitch }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirm, setConfirm] = useState('');

  const handleSubmit = () => {
    const allowedDomains = ['mail.ru', 'gmail.com', 'yandex.ru', 'bk.ru', 'outlook.com'];
    const validEmail = email.trim().match(/^[^@\s]+@([^@\s]+\.[^@\s]+)$/);
    const domain = validEmail?.[1];

    if (!email || !validEmail || !allowedDomains.includes(domain)) {
      alert('Введите корректный email (например: user@mail.ru)');
      return;
    }

    if (!password || password.length < 6) {
      alert('Пароль должен содержать минимум 6 символов');
      return;
    }

    if (password !== confirm) {
      alert('Пароли не совпадают');
      return;
    }

    onRegister(email);
  };
  function AboutPage() {
  return (
    <div className="about-page">
      <h2>О нас</h2>
      <p>Добро пожаловать на наш маркетплейс — <strong>EasyBuy!</strong></p>
      <p>Наша цель — предоставить пользователям удобный интерфейс для покупки и продажи товаров. Мы стремимся сделать онлайн-шопинг доступным, понятным и приятным.</p>
      <p><strong>Электронная почта:</strong> support@marketplace.com</p>
      <p><strong>Телефон:</strong> +7 (999) 123-45-67</p>
      <p><strong>Адрес:</strong> г. Москва, ул. Пушкина, д.1</p>
    </div>
  );
}


  return (
    <div className="auth-page">
      <h2>Регистрация</h2>
      <input placeholder="Email" value={email} onChange={e => setEmail(e.target.value)} />
      <input placeholder="Пароль" type="password" value={password} onChange={e => setPassword(e.target.value)} />
      <input placeholder="Повторите пароль" type="password" value={confirm} onChange={e => setConfirm(e.target.value)} />
      <button onClick={handleSubmit}>Зарегистрироваться</button>
      <p>Уже есть аккаунт? <button onClick={onSwitch}>Войти</button></p>
    </div>
  );
}


function AccountPage({ userEmail, onLogout, orders = [] }) {
  return (
    <div className="account-page">
      <div className="account-box">
        <h2>Личный кабинет</h2>
        <p>Добро пожаловать, {userEmail}</p>
        <button className="logout-button" onClick={onLogout}>Выйти</button>
      </div>

      <div className="orders-box">
        <h3>Ваши заказы</h3>
        {orders.length > 0 ? (
          <ul className="order-list">
            {orders.map((item, index) => (
              <li key={index} className="order-item">
                <img src={item.image} alt={item.name} className="order-image" />
                <div className="order-details">
                  <strong>{item.name}</strong>
                  <div>{item.price.toLocaleString()} ₽</div>
                  <div className="order-status">Статус: <span className="tracking-progress">в пути</span></div>
                </div>
              </li>
            ))}
          </ul>
        ) : (
          <p>У вас пока нет заказов</p>
        )}
        <button className="cart-button" onClick={() => window.location.href = '/'}>Перейти в корзину</button>
      </div>
    </div>
  );
}



function App() {
  const [cart, setCart] = useState([]);
  const [filter, setFilter] = useState('Все');
  const [page, setPage] = useState('main');
  const [email, setEmail] = useState('');
  const [delivery, setDelivery] = useState('courier');
  const [pickupAddress, setPickupAddress] = useState('');
  const [deliveryFrom, setDeliveryFrom] = useState('');
  const [deliveryTo, setDeliveryTo] = useState('');
  const [payment, setPayment] = useState('card');
  const [cardNumber, setCardNumber] = useState('');
  const [cardExpiry, setCardExpiry] = useState('');
  const [cardCvv, setCardCvv] = useState('');
  const [authPage, setAuthPage] = useState('auth'); 
  const [userEmail, setUserEmail] = useState('');
  const [regEmail, setRegEmail] = useState('');
  const [regPassword, setRegPassword] = useState('');
  const [regConfirm, setRegConfirm] = useState('');
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [orders, setOrders] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');




  const addToCart = (item) => setCart([...cart, item]);
  const removeFromCart = (i) => setCart(cart.filter((_, idx) => idx !== i));
  const total = cart.reduce((sum, item) => sum + item.price, 0);
  const filtered = products.filter(
  p =>
    (filter === 'Все' || p.category === filter) &&
    p.name.toLowerCase().includes(searchQuery.toLowerCase())
);


  const submitOrder = () => {
  const allowedDomains = ['mail.ru', 'gmail.com', 'yandex.ru', 'bk.ru', 'outlook.com'];
  const validEmail = email.trim().match(/^[^@\s]+@([^@\s]+\.[^@\s]+)$/);
  const domain = validEmail?.[1];

  if (!email || !validEmail || !allowedDomains.includes(domain)) {
    alert('Пожалуйста, введите корректный email: например, user@mail.ru');
    return;
  }

if (delivery === 'pickup') {
  setPickupAddress('Пункт самовывоза №12, ТЦ "Весна"');
}


  if (delivery === 'courier' && (!deliveryFrom.trim() || !deliveryTo.trim())) {
    alert('Укажите оба адреса: отправки и доставки');
    return;
  }

  if (payment === 'card') {
    if (!cardNumber || !cardExpiry || !cardCvv) {
      alert('Пожалуйста, заполните данные банковской карты');
      return;
    }

    const cleanCard = cardNumber.replace(/\s/g, '');
    if (cleanCard.length !== 16) {
      alert('Номер карты должен содержать 16 цифр');
      return;
    }
  }

  alert(`Заказ подтверждён!\nEmail: ${email}\nДоставка: ${delivery}\nОплата: ${payment}`);
  setOrders(prev => [...prev, ...cart]); 
  setCart([]);
  setPage('tracking'); 
};

    

  const handleCardNumberChange = (e) => {
    const value = e.target.value.replace(/\D/g, '');
    const formatted = value.replace(/(\d{4})(?=\d)/g, '$1 ').trim();
    setCardNumber(formatted);
  };

  const handleCardExpiryChange = (e) => {
    let value = e.target.value.replace(/\D/g, '').slice(0, 4);
    if (value.length >= 3) {
      value = value.slice(0, 2) + '/' + value.slice(2);
    }
    setCardExpiry(value);
  };
  const handleRegister = () => {
  const allowedDomains = ['mail.ru', 'gmail.com', 'yandex.ru', 'bk.ru', 'outlook.com'];
  const validEmail = regEmail.trim().match(/^[^@\s]+@([^@\s]+\.[^@\s]+)$/);
  const domain = validEmail?.[1];

  if (!regEmail || !validEmail || !allowedDomains.includes(domain)) {
    alert('Введите корректный email (например: user@mail.ru)');
    return;
  }

  if (!regPassword || regPassword.length < 6) {
    alert('Пароль должен содержать минимум 6 символов');
    return;
  }

  if (regPassword !== regConfirm) {
    alert('Пароли не совпадают');
    return;
  }

  alert('Регистрация прошла успешно!');
  setPage('auth');
};


  return (
    
    <div className="layout">
      <header className="header">
        <div className="logo" onClick={() => setPage('main')} style={{ cursor: 'pointer' }}>
  EasyBuy
</div>

        <div
        className="cart-info"
  onClick={() => setPage('cart')}
  style={{ cursor: 'pointer' }}
>
  Корзина {cart.length}
</div>
      </header>
      <div className="body">
        <aside className="sidebar">
  <h3>Каталог</h3>
  <ul>
    {categories.map(cat => (
      <li key={cat}>
        <button
          className={filter === cat ? 'active' : ''}
          onClick={() => {
            setFilter(cat);
            setPage('main');  
          }}
        >
          {cat}
        </button>
      </li>
    ))}
    
  </ul>

  <h3>Ваши товары</h3>
  <ul>
    <li>
      <button className={page === 'about' ? 'active' : ''} onClick={() => setPage('about')}>О нас</button>
    </li>
    <li>
      <button className={page === 'faq' ? 'active' : ''} onClick={() => setPage('faq')}>FAQ</button>

    </li>
    <li>
  <button className={page === 'tracking' ? 'active' : ''} onClick={() => setPage('tracking')}>Ваши товары</button>
</li>

  </ul>
</aside>
        <main className="container">
          {page === 'about' && (
  <AboutPage />
)}
  {page === 'faq' && <FAQPage />}
  {page === 'product' && selectedProduct && (
  <ProductPage
    product={selectedProduct}
    onBack={() => setPage('main')}
    onAddToCart={(product) => {
      addToCart(product);
      alert('Добавлено в корзину');
    }}
  />
)}
{page === 'tracking' && <TrackingPage orders={orders} />}

          {page === 'auth' && (
  authPage === 'auth'
  
    ? <AuthPage onLogin={(email) => { setUserEmail(email); setAuthPage('account'); }} onSwitch={() => setAuthPage('register')} />
    : authPage === 'register'
    ? <RegisterPage onRegister={(email) => { setUserEmail(email); setAuthPage('account'); }} onSwitch={() => setAuthPage('auth')} />
    : <AccountPage
  userEmail={userEmail}
  onLogout={() => {
    setUserEmail('');
    setAuthPage('auth');
    setPage('main');
  }}
  orders={orders}
/>


)}




      
      {page === 'cart' && (
        <div className="cart-page">
          <h2>Корзина</h2>
          {cart.length === 0 ? (
            <p>Корзина пуста</p>
          ) : (
            <>
              <ul>
                {cart.map((item, i) => (
                  <li key={i}>
                    {item.name} — {item.price.toLocaleString()} ₽
                    <button onClick={() => removeFromCart(i)}>✖</button>
                  </li>
                ))}
              </ul>
              <div className="total">
                <strong>Итого: {total.toLocaleString()} ₽</strong>
                <div className="modal-buttons">
                  <button onClick={() => setPage('checkout')}>Оформить заказ</button>
                  <button onClick={() => setPage('main')}>Назад</button>
                
            <button onClick={() => setPage('main')}>Продолжить покупки</button></div>
              </div>
            </>
          )}
        </div>
      )}

{page === 'main' && (
        <>
          <header className="header">
            <div className="logo">
  <img src={logo} alt="Логотип" className="logo-image" />
  <span className="logo-text">EasyBuy</span>
</div>
<input
  type="text"
  placeholder="Поиск..."
  value={searchQuery}
  onChange={(e) => setSearchQuery(e.target.value)}
  style={{ padding: '0.3rem', borderRadius: '4px', border: '1px solid #ccc' ,}}
/>

           
<div className="auth-button">
              <div className="auth-controls">
              <button onClick={() => setPage('auth')}>👤 Вход</button>
              <button onClick={() => setPage('auth')}>💼 Личный кабинет</button>
            </div>
</div>
{page === 'cart' && (
  <div className="cart-page">
    <h2>Корзина</h2>
    {cart.length === 0 ? (
      <p>Корзина пуста</p>
    ) : (
      <>
        <ul>
          {cart.map((item, i) => (
            <li key={i}>
              {item.name} — {item.price.toLocaleString()} ₽
              <button onClick={() => removeFromCart(i)}>✖</button>
            </li>
          ))}
        </ul>
        <div className="total">
          <strong>Итого: {total.toLocaleString()} ₽</strong>
          <div className="modal-buttons">
            <button onClick={() => setPage('checkout')}>Оформить заказ</button>
            <button onClick={() => setPage('main')}>Назад</button>
          </div>
        </div>
      </>
    )}
  </div>
)}


          </header>


<div className="products">
  {filtered.map(item => (
    <div key={item.id} className="card" onClick={() => { setSelectedProduct(item); setPage('product'); }} style={{ cursor: 'pointer' }}>
      <img src={item.image} alt={item.name} className="product-image" />
      <div className="name">{item.name}</div>
      <div className="price">{item.price.toLocaleString()} ₽</div>
    </div>
  ))}
</div>


        </>
      )}

      {page === 'checkout' && (
        <div className="checkout-page">
          <h2>Оформление заказа</h2>

          <label>Email:</label>
          <input value={email} onChange={e => setEmail(e.target.value)} type="email" placeholder="example@mail.com" />

          <label>Способ доставки:</label>
          <select value={delivery} onChange={e => setDelivery(e.target.value)}>
            <option value="courier">Курьер</option>
            <option value="pickup">Самовывоз</option>
          </select>
          {page === 'register' && (
  <div className="auth-page">
    <h2>Регистрация</h2>
    <input
      type="email"
      placeholder="Email"
      value={regEmail}
      onChange={(e) => setRegEmail(e.target.value)}
    />
    <input
      type="password"
      placeholder="Пароль"
      value={regPassword}
      onChange={(e) => setRegPassword(e.target.value)}
    />
    <input
      type="password"
      placeholder="Повторите пароль"
      value={regConfirm}
      onChange={(e) => setRegConfirm(e.target.value)}
    />
    <button onClick={handleRegister}>Зарегистрироваться</button>
    <p>
      Уже есть аккаунт?{' '}
      <button onClick={() => setPage('auth')}>Войти</button>
    </p>
  </div>
)}




          {delivery === 'courier' && (
            <>
              <label>Пункт отправки (склад/магазин):</label>
              <input
                value={deliveryFrom}
                onChange={e => setDeliveryFrom(e.target.value)}
                placeholder="г. Барнаул, ул. Ленина, д. 5"
              />
              <label>Адрес доставки:</label>
              <input
                value={deliveryTo}
                onChange={e => setDeliveryTo(e.target.value)}
                placeholder="г. Барнаул, ул. Пушкина, д. 10, кв. 42"
              />
              <div className="map-container">
                <YandexMap />
              </div>
            </>
          )}

          <label>Метод оплаты:</label>
          <select value={payment} onChange={e => setPayment(e.target.value)}>
            <option value="card">Банковская карта</option>
            <option value="cash">Наличные</option>
          </select>

          {payment === 'card' && (
            <>
              <label>Номер карты:</label>
              <input
                value={cardNumber}
                onChange={handleCardNumberChange}
                placeholder="0000 0000 0000 0000"
                maxLength={19}
              />
              <label>Срок действия:</label>
              <input
                value={cardExpiry}
                onChange={handleCardExpiryChange}
                placeholder="MM/YY"
                maxLength={5}
              />
              <label>CVV:</label>
              <input
                value={cardCvv}
                onChange={e => setCardCvv(e.target.value)}
                placeholder="123"
                maxLength={3}
              />
            </>
          )}

          <div className="modal-buttons">
            <button onClick={submitOrder}>Подтвердить</button>
            <button onClick={() => setPage('main')}>Назад</button>
          </div>
        </div>
      )}
    
        </main>
      </div>
      <footer className="footer">
        © 2025 маркетплейс. Все права защищены.
      </footer>
    </div>
  );

}

export default App;
