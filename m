Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 594FE9C187D
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 09:54:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9KlB-0007QW-Eo
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 08:54:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1t9Kku-0007JA-Mx
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 08:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kuMMItLYzFCoobqi01tA+K1arxATzzRbaTv/6NYr6os=; b=So3l0wQHJNEaYRWNJU1HokdbLY
 0GxyUVvGjRxP94vug/UyZ2Zmh0xY8vvlTc9/jEFjPSLydiOMbnLbtKPcb7GbALF6Sz9oXEqtac01M
 4EHKHM1msEUkvWFay9/jv/DHQRcr9BWS+eWt62ZplS/duY9mgZGOJNfUFrTomk/MpQAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kuMMItLYzFCoobqi01tA+K1arxATzzRbaTv/6NYr6os=; b=RUQDm5C5mhpsJ768GGgexQQ4Wr
 xjqkqsJuNDS/Eq6GktKjfWQWaIBfUrWP34PtNzMbZeJOZuhXUpj7GGRMJijByZrZAT7C9izuvAIWM
 Uy3d7m786Y+qU2ceZF13zfNCAuEGl+MVsE53/D46bUY8UGluEfk8anjAkN1+vHUMt0Gg=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9Kku-00013j-RY for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 08:54:13 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso16747425e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 00:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731056041; x=1731660841; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kuMMItLYzFCoobqi01tA+K1arxATzzRbaTv/6NYr6os=;
 b=B+gx9b772hgbUJ8ygcsgOphCrRU/ipl+dCqsdLl9gk88qmTi496XNpuATl5BiaT/7O
 6hXY+VK5DcEvQDvJ+BBIV06/ZvOv9Xez03W7Vg2BPrZMEOcqUDvS6fVxqv/YRoePSYC6
 Z2qpMRRjU2glGWlQNk7Q/ZJkf8+th5aD87FtIEFRQQ6wumKxXR9qiEQ4rhbGA5DchBsE
 5+NyF/u+vlFNBI8LSjQ96UG6IoWilPCAKCOy4BZsuN3JCdUSKZG34vA31mlF9FZ7jvBk
 xaznwqZSQcOAYJrUliXuhVuruvNQ/VDFKN1/w73slP6R35YgzSzUlmuu8e3zp9ov/3CA
 wxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731056041; x=1731660841;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuMMItLYzFCoobqi01tA+K1arxATzzRbaTv/6NYr6os=;
 b=I6h+Os1N1raqvsct60aoosw6jtLZu03i6wJUv2J2gIj+fzqVwrbJT3QDHPjolq7Dks
 19/qHFghyRB/dtz01yp8DLr/GI/2Thv6Gh4NUCIiuJM2Z3l/x4cl8rex6DwgYpk3KZd+
 LR64o/ModBBzAVsBaqt2QiZsWfS8oIJPddTBSTKW9yGLQue2EnGQ0yPs2l/rQCEsXURK
 uQixyPZfLfPm4FwBYOUlEAMgDUgOm1usijK/6GpjwjVfqDcuGUc4yZwD99HZ95oLiFdU
 v2VWiR1xXmycZdbbxbBw06FJoHrcx1dUISf8yeov6vI4XU0QUoivMlk8v9fn7FEKNKkS
 UOMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQXXZYem4NWBWDqXj3gXOMyP7lY7jz62U4xVecInr5fhOA0fcNF5X2NMndHfQgHKI9Rx377s2MbfpR88paTA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw3lF5O0hCFOm66ww/YqX+J+js4bDKWEcbn88so/z7CVboEa9mk
 +Z9/kD61sgUAsi654TfSb4AMK88ALy3C4xm1xJOEblpidPcxJf80fCrS62Yp6ydDOFgQE1EPuS1
 L1uXQPA==
X-Google-Smtp-Source: AGHT+IEbn82YtanjJwsBTFkxT0F7uSzZx2KIbtNokrqQeZSRioBBYxItPzf3xppwRdTzkRVo7qD0tQ==
X-Received: by 2002:a05:6000:480d:b0:37d:4894:6878 with SMTP id
 ffacd0b85a97d-381f1862d7dmr1755298f8f.10.1731054696912; 
 Fri, 08 Nov 2024 00:31:36 -0800 (PST)
Received: from aspen.lan ([154.14.63.34]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04ad0sm3876370f8f.100.2024.11.08.00.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 00:31:36 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 08 Nov 2024 08:30:45 +0000
MIME-Version: 1.0
Message-Id: <20241108-new-maintainer-address-2-v1-2-47c9d71aac11@linaro.org>
References: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
In-Reply-To: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=714;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=QJ1shEfgNhMbzUoWs/iI/qCnvnU4Abj00tvjzrGfSIw=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBnLcxWQsD/YJwtzmPwpQMVWHqtNS07maf3x0/vh
 5r9h43cLqqJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZy3MVgAKCRB84yVdOfeI
 oVW4D/9FVXqDJq4DHUBD4lKDdXOmtcMWGMXhsMBQCl0mRzsT9PVQeWXyNsDOqkgfzXckkgdh6vy
 zFM5AlBzmJsuh5bffLhMQyxUjvTXUD5yTpIOtF4WrLiEO5CQs1uuSD9JKZxFd7MZbBkheZCmiJZ
 6MEqwdsqyKG6ASwhaPh6H6NT5DuWmstx7INWkXJyHfDtLtOh59XjCoUtvZhvPix9z1XoWhh/M0G
 XF3/i2sWRmXwCyx5DkA+7TPnCWF3COzCXqSV0I4blHDIAptgCYnxF1Jk2Is33yaW9K75kiPez0u
 FvtuYFgm5u7YgI+l2ir1rZXnE7QD8UJ/1jGJb/20Cx/9VsEEuKFeRooaXqCq57bd1BpMfU7KcJl
 oAAtiRkrF6RvAaB4xuGwLnPAAsrQRjk1CJG/9Fj2z7wwX9VYqqd9CSzsHGlbdgRkzFRItynjUWe
 gmzmPJL/U1E6YvHm1/LKcWHGbtnPcOeXUXgb5HCzAzw7LlAE8iQudzBMQu0Jn9W8LeGQtXlAVgI
 uN9eToS/EJuooHnnFESqCVLs3kvyJB8V1UHdWzaUdH6iHzuiCWu1kdFZMGztArU5zV7oU03DIle
 nOYocmse3gLulu+QbxvediGRjUfvb02G5AK72LafTVRS4SOdslvAMwFCECE6tUjXC+VwDIwoaMe
 KXmonldOnXGkAjw==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Going forward,
 I'll be using my kernel.org address for upstream
 work. Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org> ---
 MAINTAINERS
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) diff --git a/MAINTAINERS
 b/MAINTAINERS index
 5396fd1b15aee1eb2a234ba8963c57571d532a91..a88528c14e372856f83c60392240a3f1a41f6032
 100644 --- a/MAINTAINERS +++ b/MAINTAINERS @@ -12659,7 +12659,7 @@ F: sa
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.53 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
X-Headers-End: 1t9Kku-00013j-RY
Subject: [Kgdb-bugreport] [PATCH 2/2] MAINTAINERS: Use Daniel Thompson's
 korg address for kgdb work
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Going forward, I'll be using my kernel.org address for upstream work.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5396fd1b15aee1eb2a234ba8963c57571d532a91..a88528c14e372856f83c60392240a3f1a41f6032 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12659,7 +12659,7 @@ F:	samples/kfifo/
 
 KGDB / KDB /debug_core
 M:	Jason Wessel <jason.wessel@windriver.com>
-M:	Daniel Thompson <daniel.thompson@linaro.org>
+M:	Daniel Thompson <danielt@kernel.org>
 R:	Douglas Anderson <dianders@chromium.org>
 L:	kgdb-bugreport@lists.sourceforge.net
 S:	Maintained

-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
