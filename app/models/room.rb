class Room < ApplicationRecord
    has_many :room_user
    has_many :user, through: :room_user
    has_many :message

    enum tipe:  
    {
        publik: 0,
        privat: 1
    }



def new_att
        {
            user: self.user.nama,
            message: self.message.chat
        }
    end
end
