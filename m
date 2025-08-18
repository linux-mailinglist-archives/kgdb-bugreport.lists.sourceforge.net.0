Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D16CDB2B376
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 18 Aug 2025 23:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFeJGwClDGwco3X+h6i2tONxUBLo3FYd32AebzuOm0M=; b=VuvQ3F55asYCIuXVVLao+krVYy
	KjOSKXvAF6FhUdpt1JMzqwH+AmBMK5UEpDnx3lYM3LWIciU9F3yeBodNm7630pAuO9mV17WR2TgDz
	ybRXscWDBnlKr0Lsbf4xef6L+7ce768gV5S4/50YvQ/RdQ4uXYIRPdHlg9Ya9GMVdrro=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uo7Sk-0007XQ-Uc
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 18 Aug 2025 21:32:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uo7Sj-0007X8-Bs
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 18 Aug 2025 21:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1a5SHWZT5ObhjuEG18Uce/tsKkrsIEanMlhP2HGBzsE=; b=X7SIanMbaoqORl8x6AxGWVAbu8
 UbdEG42QJCxFzibQErL91YJbcQXv0rNACvnx5uwySLNndBtvTE1n81bJk1yvT+UyZLgRnsaXyZJZR
 A8KVhp7rJV3dhT24JK/oI9i7Bq1urYo/f41sjm4dRbbaXMF05cqOfza745px10SeNodk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1a5SHWZT5ObhjuEG18Uce/tsKkrsIEanMlhP2HGBzsE=; b=Ud9SyLy6fGDevJSR1S4bBsXwdp
 MOWISUxIYdO/uZSCr9s+GRuqClu1KcO7OsCcosGf3Fy5kZu1YsBoIK1zGPUp9nTbs5s711+CIzkML
 TPkirSSPmVFDnb6ZnxashXXGfdjDaT3zqvRxh5xeSkgnn402/sWdi34rs44X5BnvsdVs=;
Received: from mail-qt1-f179.google.com ([209.85.160.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uo7Sj-0006vh-P0 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 18 Aug 2025 21:32:18 +0000
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4b28184a8b3so6854831cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 18 Aug 2025 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755552732; x=1756157532;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1a5SHWZT5ObhjuEG18Uce/tsKkrsIEanMlhP2HGBzsE=;
 b=mKUdZ0lZs1MVVKWlxkvnF7blyXJMXAe4ZPLAYrZWhvfInvu/3EX5um+VVLAO0bw7gr
 YJ4Ge0iXU0GgNS5QB6fICgCn4U6lQ1lMKcfLxbRNcKScjev6mYMJNYi75WLn5yig5V3S
 CN/3V/ZY2kBx/k7hPcNNpE0pdm8K9UeAVtqUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755552732; x=1756157532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1a5SHWZT5ObhjuEG18Uce/tsKkrsIEanMlhP2HGBzsE=;
 b=CTK5rb4b8IZhk3KKZ/ERe31ziZKzqJ9iQiIwhg8FbbHpPJPQr+38z3ch3xL7MKMWlI
 pTXx3ddchLwCB2/Os7stiVZ3QAeUODhcAn2n+tYhWq6WuK3V/47J5Z0UCbaL2lbnZS82
 rCP4LJZwaxiSsfKbTk/hPbNvmXC9C7f5EaN/zQ+UvFBlfQoVpVbfZvM1LpVcI5z7Ga54
 ZyAwL3JMo4a0W5CSvtBY3Gwbi+EtA2m3in2VCIj12qIPEmCycGQEMnphiS5QZq+w1pkU
 DJYmzrK4mHDoWc1IPXZlH1vUwjZUQ9K0ssGsJYTwtl+hD4qEHr19o8EeHiTO7fLC5wbs
 udkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaXn8uSvBGTwsFEbgadCJtDa7Um7bO5RZubquEZgDXoCktk2fSvBtaGtGfao+0nUTKYYlbrM7WQNuxWDNe4Q==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz9q4JAHumEi4thjldKneF7xjMf+/WbYctkzWQot7NBCokpyFLh
 Z4DyF+LubIe015UzJjcAS0w0/sCuLtw1cVjH+HKCmhWNal3Z6zVqeUjppqJfOjZbydwHiZ9i4Ux
 zxQBevMBG
X-Gm-Gg: ASbGncszXu9Fzk0Qsi6p2KCcjoAg9NM0tLn6+LARFEQXU6n72526/b1stdT/ZQTj/ij
 H+wrEolGaO/c8YKaj86UXBb5dH9j0CMWTbeomFNDuOhX+QYjDPmM/4p1uPF6S9UOS2sXpMUkfKb
 Vq+An7MetFc2jzT9ND2IxkG0m3Pb6DpgKtdoWE9O8jQaguqH3TMP1v8RHbcdK9BAkKald3cAxm5
 UTQDi7YNQSH4jsqQ0T7xoRnXzo9EOlp0Vl729x81d8ZHnr53GQx7JWvJKFRJb/uF/YC9fvXYJ5P
 BT08tf3BOOvUjZ2jjJhtR33L3Hw4ygsGI5+wtFbsh8U9zwGBYCg9fFUoQFb2gqop2jjTB2VI72X
 P+T4vIBONASDsFQ1RpurHKy7tkbsIHCHCWfbkBIGea+8J+nNC6PbzXkfuKnYNC2gT63o/AOVKcS
 hL
X-Google-Smtp-Source: AGHT+IGnT7wyB+XXEoPLygjiKY69BTnKb4CAdEsf19IL7l5pW9bYIMV4WLq0KzWe50olNJe1ChGutA==
X-Received: by 2002:a17:90b:1cce:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-32476a30849mr398974a91.15.1755549749386; 
 Mon, 18 Aug 2025 13:42:29 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com.
 [209.85.210.172]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4755bb9d09sm149812a12.40.2025.08.18.13.42.28
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 13:42:28 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76e2e8bb2e5so4969893b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 18 Aug 2025 13:42:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWpZWO7QYF9ma3hlm1jAxJxOv4Wyp/nzr14F5CyJQEHbFwzrM1fnzKLx4qXWb3bSGzmDvVneV8htiTWe/Nugw==@lists.sourceforge.net
X-Received: by 2002:a17:903:28e:b0:243:926:b1f3 with SMTP id
 d9443c01a7336-245e030c986mr619005ad.24.1755549747360; Mon, 18 Aug 2025
 13:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250818181153.661431-1-thorsten.blum@linux.dev>
 <20250818181153.661431-4-thorsten.blum@linux.dev>
In-Reply-To: <20250818181153.661431-4-thorsten.blum@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 13:42:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhEeZdCwL0kVmDHZF03q+Jp5iOiUvbNNoCDuBr3os9qQ@mail.gmail.com>
X-Gm-Features: Ac12FXy3Z47CKyrKqijfaotNViVGOwKbhTPJHzFwx9GEuH8Qe5j9BxC7wx8gFu8
Message-ID: <CAD=FV=UhEeZdCwL0kVmDHZF03q+Jp5iOiUvbNNoCDuBr3os9qQ@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Aug 18,
 2025 at 11:13 AM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > +/* > + * kdb_strdup_dequote - same as kdb_strdup(), but trims
 surrounding quotes from > + * the input string if pre [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uo7Sj-0006vh-P0
Subject: Re: [Kgdb-bugreport] [PATCH 4/4] kdb: Replace deprecated strcpy()
 with helper function in kdb_defcmd()
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
Cc: Nir Lichtman <nir@lichtman.org>, Jason Wessel <jason.wessel@windriver.com>,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>,
 Zhang Heng <zhangheng@kylinos.cn>, Daniel Thompson <danielt@kernel.org>,
 linux-hardening@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEF1ZyAxOCwgMjAyNSBhdCAxMToxM+KAr0FNIFRob3JzdGVuIEJsdW0gPHRo
b3JzdGVuLmJsdW1AbGludXguZGV2PiB3cm90ZToKPgo+ICsvKgo+ICsgKiBrZGJfc3RyZHVwX2Rl
cXVvdGUgLSBzYW1lIGFzIGtkYl9zdHJkdXAoKSwgYnV0IHRyaW1zIHN1cnJvdW5kaW5nIHF1b3Rl
cyBmcm9tCj4gKyAqICAgICAgICAgICAgICAgICAgICAgdGhlIGlucHV0IHN0cmluZyBpZiBwcmVz
ZW50Lgo+ICsgKiBSZW1hcmtzOgo+ICsgKiAgICAgUXVvdGVzIGFyZSBvbmx5IHJlbW92ZWQgaWYg
dGhlcmUgaXMgYm90aCBhIGxlYWRpbmcgYW5kIGEgdHJhaWxpbmcgcXVvdGUuCj4gKyAqLwo+ICtj
aGFyICprZGJfc3RyZHVwX2RlcXVvdGUoY29uc3QgY2hhciAqc3RyLCBnZnBfdCB0eXBlKQo+ICt7
Cj4gKyAgICAgICBzaXplX3QgbGVuID0gc3RybGVuKHN0cik7Cj4gKyAgICAgICBjaGFyICpzOwo+
ICsKPiArICAgICAgIGlmIChzdHJbMF0gPT0gJyInICYmIGxlbiA+IDEgJiYgc3RyW2xlbiAtIDFd
ID09ICciJykgewo+ICsgICAgICAgICAgICAgICAvKiB0cmltIGJvdGggbGVhZGluZyBhbmQgdHJh
aWxpbmcgcXVvdGVzICovCj4gKyAgICAgICAgICAgICAgIHN0cisrOwo+ICsgICAgICAgICAgICAg
ICBsZW4gLT0gMjsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBsZW4rKzsgLyogYWRkIHNwYWNl
IGZvciBOVUwgdGVybWluYXRvciAqLwo+ICsKPiArICAgICAgIHMgPSBrbWFsbG9jKGxlbiwgdHlw
ZSk7Cj4gKyAgICAgICBpZiAoIXMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsK
PiArICAgICAgIG1lbWNweShzLCBzdHIsIGxlbik7Cj4gKyAgICAgICBzW2xlbiAtIDFdID0gJ1ww
JzsKClZlcnkgbml0dHksIGJ1dCB0ZWNobmljYWxseSB0aGUgYWJvdmUgbWVtY3B5KCkgY291bGQg
cGFzcyAibGVuIC0gMSIsIHJpZ2h0PwoKSXQgZG9lc24ndCByZWFsbHkgbWF0dGVyIG90aGVyIHRo
YW4gdGhlIHdhc3RlZnVsIGNvcHkgb2YgMS1ieXRlLCBzbzoKClJldmlld2VkLWJ5OiBEb3VnbGFz
IEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0Cktn
ZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
