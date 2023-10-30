Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731A7DBEF7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 30 Oct 2023 18:31:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qxW6k-0000Ew-80
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 30 Oct 2023 17:31:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qxW6i-0000Eq-Pw
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 30 Oct 2023 17:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xavDmDYDKGApF37pHfgaeVpvo2fMN9hqfhiSorYJU94=; b=RCKDEayOKWYzXE3QPQupjuLlqd
 u6IWmpnsLwYZPtknSvAfN9Xm1452CpZ/n0TXf0GxI3ZdGeUP/k8biIXB2ubg9HE814tL3Hojck/2K
 Cm2qqipH+QxEY9vXN3zrB55AMr7ReD81A1ZqJg8NK7bi3av/kYlgyNzMYteobZv6PhiM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xavDmDYDKGApF37pHfgaeVpvo2fMN9hqfhiSorYJU94=; b=ei/gS4AxXOmm5x6SRA9T91vmlr
 UoiK+a/eS7R905hhaoNAMYL0ZMsCX6uUv4uEzk9Asoammj8Dj6Tb5+ERXEB/PHCmLa6PKzpRUXoab
 Azshr2ABudhuD1RxJpggg/7l23ZSXUUaJAtPXal9cqWwY3H9rw1SDwmdJ8MRoO7VBZIc=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qxW6e-0003Xq-Tx for kgdb-bugreport@lists.sourceforge.net;
 Mon, 30 Oct 2023 17:31:21 +0000
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2c595f5dc84so65103761fa.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 30 Oct 2023 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698687070; x=1699291870;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xavDmDYDKGApF37pHfgaeVpvo2fMN9hqfhiSorYJU94=;
 b=hnKd5nupWVa0XS8o1skD3r3aO+ICxgIXRHNsGiUTu/X+WuDMKs0Z3zYM0oy54d467o
 G93mJoBjNSqqgiam93YscXixvNwvnSZ2fFE5QFa03JJnOnDZA90EAEQs4mf4ZE7ge0mL
 d7dW6/6qkiuvroWxQg84sUSCrzyBmQIrimkWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698687070; x=1699291870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xavDmDYDKGApF37pHfgaeVpvo2fMN9hqfhiSorYJU94=;
 b=dnmqOpt1RiT0lL/WRdbCFbicLRT03fiWD2MdJVZnOZ4J6mwyWC0CGVHCPNAD2hctwy
 cRpKgRWa4FW5wdZvco5MBXoI+m0HYB0B6UnTtQJhLyTkwNNJ1FjT2oyoswPdyXqDmUEq
 TkejFOUFzwqprIECnZtZaHo5kpstuEYhU5u98XHx50RTZwfGABabcpdPvQV53QrLltK8
 3/PSl7Cn23oNmFaMwFBuz8LkD0Vz908yHd0RKC/7PjKVCLS1VvgbQVzYAzhldtJxCaZg
 7a+De+fFwBETWMOawGNKBNpd1FE9leKymMBX7H7wOkN4BxMDgycdFQAclqulJP7OEzjk
 xCUQ==
X-Gm-Message-State: AOJu0YzRjXotUnwo94dyfqC/2IL1EdS7Nz22t36xS+rIgWmbXt9TSJC7
 FWw8F+X92I4wzCnyeXr7PCuBSGFdumlxb38U5OCfhHyb
X-Google-Smtp-Source: AGHT+IFKeCAiHo+9MopxH79jYmJ7AOHqgQD3tEaKGw9IjS5ZYURJ8hQoqDiqcnWTsxvhUwC9a++fFQ==
X-Received: by 2002:a50:cd14:0:b0:53e:1533:394 with SMTP id
 z20-20020a50cd14000000b0053e15330394mr95533edi.21.1698683792177; 
 Mon, 30 Oct 2023 09:36:32 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 c24-20020a50d658000000b00536ad96f867sm6420006edj.11.2023.10.30.09.36.31
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 09:36:31 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so116855e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 30 Oct 2023 09:36:31 -0700 (PDT)
X-Received: by 2002:a05:600c:1d17:b0:400:c6de:6a20 with SMTP id
 l23-20020a05600c1d1700b00400c6de6a20mr133775wms.3.1698683791371; Mon, 30 Oct
 2023 09:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <0b1790ca91b71e3362a6a4c2863bc5787b4d60c9.1698501284.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <0b1790ca91b71e3362a6a4c2863bc5787b4d60c9.1698501284.git.christophe.jaillet@wanadoo.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Oct 2023 09:36:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSh7wKN7Yp-3wWiDgX4E3isQ8uh0LCzTmd1v9Cg9j+nQ@mail.gmail.com>
Message-ID: <CAD=FV=WSh7wKN7Yp-3wWiDgX4E3isQ8uh0LCzTmd1v9Cg9j+nQ@mail.gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Oct 28, 2023 at 6:55 AM Christophe JAILLET <christophe.jaillet@wanadoo.fr>
    wrote: > > When appending "[defcmd]" to 'kdb_prompt_str', the size of the
    string > already in the buffer should be [...] 
 
 Content analysis details:   (-0.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qxW6e-0003Xq-Tx
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix a potential buffer overflow
 in kdb_local()
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Martin Hicks <mort@sgi.com>,
 kgdb-bugreport@lists.sourceforge.net, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIE9jdCAyOCwgMjAyMyBhdCA2OjU14oCvQU0gQ2hyaXN0b3BoZSBKQUlMTEVU
CjxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6Cj4KPiBXaGVuIGFwcGVuZGlu
ZyAiW2RlZmNtZF0iIHRvICdrZGJfcHJvbXB0X3N0cicsIHRoZSBzaXplIG9mIHRoZSBzdHJpbmcK
PiBhbHJlYWR5IGluIHRoZSBidWZmZXIgc2hvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudC4KPgo+
IFN3aXRjaCBmcm9tIHN0cm5jYXQoKSB0byBzdHJsY2F0KCkgd2hpY2ggZG9lcyB0aGUgY29ycmVj
dCB0ZXN0IHRvIGF2b2lkCj4gc3VjaCBhbiBvdmVyZmxvdy4KPgo+IEZpeGVzOiA1ZDUzMTRkNjc5
NWYgKCJrZGI6IGNvcmUgZm9yIGtnZGIgYmFjayBlbmQgKDEgb2YgMikiKQo+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+Cj4g
LS0tCj4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEva2VybmVs
L2RlYnVnL2tkYi9rZGJfbWFpbi5jIGIva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gaW5k
ZXggNDM4Yjg2OGNiZmE5Li5lNWYwYmYwZjQ1ZDEgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RlYnVn
L2tkYi9rZGJfbWFpbi5jCj4gKysrIGIva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gQEAg
LTEzNTAsNyArMTM1MCw3IEBAIHN0YXRpYyBpbnQga2RiX2xvY2FsKGtkYl9yZWFzb25fdCByZWFz
b24sIGludCBlcnJvciwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gICAgICAgICAgICAgICAgIHNu
cHJpbnRmKGtkYl9wcm9tcHRfc3RyLCBDTURfQlVGTEVOLCBrZGJnZXRlbnYoIlBST01QVCIpLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiAgICAg
ICAgICAgICAgICAgaWYgKGRlZmNtZF9pbl9wcm9ncmVzcykKPiAtICAgICAgICAgICAgICAgICAg
ICAgICBzdHJuY2F0KGtkYl9wcm9tcHRfc3RyLCAiW2RlZmNtZF0iLCBDTURfQlVGTEVOKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBzdHJsY2F0KGtkYl9wcm9tcHRfc3RyLCAiW2RlZmNtZF0i
LCBDTURfQlVGTEVOKTsKClNvbWUgb2YgdGhpcyBjb2RlIGlzIGEgYml0IGhhcmQgdG8gZm9sbG93
LCBidXQgSSB0aGluayBpdCdzIGJldHRlciB0bwpzaW1wbHkgZGVsZXRlIHRoZSB3aG9sZSAic3Ry
bmNhdCIuIFNwZWNpZmljYWxseSwgYXMgb2YgY29tbWl0CmEzNzM3MmY2YzNjMCAoImtkYjogUHJl
dmVudCBrZXJuZWwgb29wcyB3aXRoIGtkYl9kZWZjbWQiKSBpdCdzIGNsZWFyCnRoYXQgImRlZmNt
ZCIgY2FuJ3QgYWN0dWFsbHkgYmUgcnVuIHRvIGRlZmluZSBuZXcgY29tbWFuZHMKaW50ZXJhY3Rp
dmVseS4gSXQncyBhbHNvIGNsZWFyIHRvIG1lIHRoYXQgImRlZmNtZF9pbl9wcm9ncmVzcyIgaXMg
b25seQpzZXQgd2hlbiBkZWZpbmluZyBuZXcgY29tbWFuZHMuCgpUaGUgcHJvbXB0IGJlaW5nIGNv
bnN0cnVjdGVkIGhlcmUgaXMgYSBwcm9tcHQgdGhhdCdzIHByaW50ZWQgdG8gdGhlCmVuZCB1c2Vy
IHdoZW4gd29ya2luZyBpbnRlcmFjdGl2ZWx5LiBUaGF0IG1lYW5zIHRoZSAiaWYKKGRlZmNtZF9p
bl9wcm9ncmVzcykiIHNob3VsZCBuZXZlciBiZSB0cnVlIGFuZCBpdCBjYW4gYmUgZGVsZXRlZCBh
cwpkZWFkIGNvZGUuCgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8va2dkYi1idWdyZXBvcnQK
