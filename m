Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F4AD2880
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  9 Jun 2025 23:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcGlezylHO/dG7aQDdy1PRwziapTS0CmnFuT9fR9KaA=; b=Y4W1b47nkPEEGRm4yHgHRL0JEh
	WjVyDsHTAt55lYoTzZVBtfX60gs2qR7mQIFRcgnN8oUdcgkwa+ssr1zWbTpkeeNwkVSQKf8zi6OTp
	p2UB+Uh/HkrWU2CeTQlQt9Ey3ciwWCamx2+bGGOQDeAw6u/fczOvlc6+34DoITyKZaLg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uOjmD-00044Q-Un
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 09 Jun 2025 21:11:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uOjmC-00044I-NT
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 09 Jun 2025 21:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9yFNgGlGCkVHg1knXwtU8l8k12+pdKexGY49aaidt7U=; b=aSnsIU3SoFKbOxiKGsDOcGJ/Dk
 m0rLw1t8dS2vVhUjQwJO2Jxd7lEHTRXxT/u2Rvz0V2nxX0YOM7/9hr/qQzTnLup+AGfOB3XplVUVS
 wxVpU2qOFaOa8aRTFoUivbe2wl+NOMQFnXfrpb9V3Aeas9T7mhJpQkPbq3vLTScIzuKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9yFNgGlGCkVHg1knXwtU8l8k12+pdKexGY49aaidt7U=; b=fgE/R7Ut+egG/b0v9EgWfskNWE
 wONeVJ/OSiHEAWZ49Bcdto6PIbaUOLfiF8HlVIl9UfU37nqYzF2dFSuBlWLDilD8rrtgb38aB+asu
 0pWNrFzmnKFIYFVs1n5xANc8pVpn0BzMQx1kWaIuKb7vOW2r5KXs8O/pjxB+gaphK7tM=;
Received: from mail-qt1-f169.google.com ([209.85.160.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uOjmC-0005wJ-BZ for kgdb-bugreport@lists.sourceforge.net;
 Mon, 09 Jun 2025 21:11:28 +0000
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4a5851764e1so94838811cf.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 09 Jun 2025 14:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749503482; x=1750108282;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yFNgGlGCkVHg1knXwtU8l8k12+pdKexGY49aaidt7U=;
 b=WZykbYYRTA1tga532S1TBRxGeYFqnHQ115WvT8Xmzimq4QBIXAktB8NuQK9fTWhIhm
 D0mkcNmfY/j4Ed7IUT35+/SDDYrNvZCHfTfygJ2q5Wb+JXacnwKhPBKSIZ+PhXR/W8Em
 sadK0dcRJmFPeWinMRcvggg+TtUEAr/5e3YX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749503482; x=1750108282;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yFNgGlGCkVHg1knXwtU8l8k12+pdKexGY49aaidt7U=;
 b=SLZvn8wE96GV6MN+wlIqlHMGMPVPCXuMePdRof28aOv4Ikb93xuj/x83JA7HzsWLit
 IjXH5FBKWJNiwMZptWuFxCd5Q/cUKWGx3WOFZ36jlOYxLO+0O9W8jeNTdLRBPEjJgF6A
 Z0dlisXf6FH1x/5LZ1MpIDBiO8h7QGTuo0j4yiGgETRkiQpgjQ7ey6mJlY5mLW97k6qj
 91NEg27IZcXHG0vyb8PNXw2zD8vPJdj6ZGucDPFRSwcpxcHPm6hiK07O/kDfZPzAKFN1
 0pFLxOgGlzLa1UqkyCjTDm7pDJ8rMkEGYTuoSiTXWgjP4fqWr8vyroF5gVmj23/HgBFn
 KIow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUArbWgRtvinjXEPzj+PddJ8GS6HKevoGBeXKl3VyqMwUvzyPJQGwJikn1lrkjK9RG0EeeifZAOBPW+2SK7YA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxMv1DHeJw6BnpjfoZgTM7BOvHayijWo77Akz/IlLtnzcbJ9OBO
 QLBWVDqEjFjZ8SaklrRTiVtvqpDxXuzouhyPc1vgeVWoViVgU+5Mj8a4SkQjgFxKS/9c3tsr5CR
 Gpm7H6w==
X-Gm-Gg: ASbGncuG5e8moM7AR6yu1YyPy+kDqPM6o3hxvr7MI2OrxG8WK5ko0Lbb8z68u35BPWi
 iZTUX+CEqpRLpgl4cDxiOkJ7nWjTGkWdmr5sqLznjhKNm1X9XI1YJV835dCT+PvTZSg/VnfOwDN
 aezjoQbhFYPXH3Ka83vLMzmXiDAw7QNu2zuCE8NQzVSopdpj/sz8Ikra2Vx42H3l1wc6fKCb3zH
 5LeR+VTVQs665UroYLnR1iwqNZb64Qki8/hFWqAL9FUPErVHvXvcI42d8vBGtb8UFYFgJO8xL+0
 4C/pVn7hPLFqHaxyuhiLminpSBnRhV9qvWZvOa/gO2gGOBav1fMBSjpjIyTuVEVOBMqfVPi4XUg
 AHrBepDpFyQuXSqSBD+NKnsGq9g==
X-Google-Smtp-Source: AGHT+IELGK2OS8PDGtd281X69proJ9Qhf96lexTJRU7ZCYU7FCzbT/wRV4M9BX8Xoa8ljXmm+ROoVQ==
X-Received: by 2002:a05:6a00:4fc5:b0:740:9a4b:fb2a with SMTP id
 d2e1a72fcca58-74827f39e8fmr21729873b3a.20.1749500016714; 
 Mon, 09 Jun 2025 13:13:36 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0ec4aasm6289623b3a.171.2025.06.09.13.13.33
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 13:13:34 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-31393526d0dso567916a91.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 09 Jun 2025 13:13:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSdHdJ+fyTF56bc+zL00KOwPXlntgA76KrdxYi7fA2Ud0j6dfjRAEq0uKMYolaWK8i04+1ArVxmePKiT5b4Q==@lists.sourceforge.net
X-Received: by 2002:a17:90b:2d4e:b0:311:afd1:745b with SMTP id
 98e67ed59e1d1-313472e8c6dmr21398818a91.11.1749500013266; Mon, 09 Jun 2025
 13:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
In-Reply-To: <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 13:13:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
X-Gm-Features: AX0GCFtFMIswKIAvt6rQB2Iu1HAY0gUkQ581gK2nBv_6C3TWCO4_jkt3VeYMeO4
Message-ID: <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Jun 6,
 2025 at 7:54 PM Marcos Paulo de Souza <mpdesouza@suse.com>
 wrote: > > All consoles found on for_each_console are registered, meaning
 that all of > them are CON_ENABLED. The code tries t [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uOjmC-0005wJ-BZ
Subject: Re: [Kgdb-bugreport] [PATCH 4/7] drivers: serial: kgdboc: Check
 CON_SUSPENDED instead of CON_ENABLED
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
Cc: Petr Mladek <pmladek@suse.com>, Richard Weinberger <richard@nod.at>,
 John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEp1biA2LCAyMDI1IGF0IDc6NTTigK9QTSBNYXJjb3MgUGF1bG8gZGUgU291
emEgPG1wZGVzb3V6YUBzdXNlLmNvbT4gd3JvdGU6Cj4KPiBBbGwgY29uc29sZXMgZm91bmQgb24g
Zm9yX2VhY2hfY29uc29sZSBhcmUgcmVnaXN0ZXJlZCwgbWVhbmluZyB0aGF0IGFsbCBvZgo+IHRo
ZW0gYXJlIENPTl9FTkFCTEVELiBUaGUgY29kZSB0cmllcyB0byBmaW5kIGFuIGFjdGl2ZSBjb25z
b2xlLCBzbyBjaGVjayBpZiB0aGUKPiBjb25zb2xlIGlzIG5vdCBzdXNwZW5kZWQgaW5zdGVhZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IE1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2Uu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMgfCAzICsrLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5jIGIvZHJpdmVycy90dHkvc2VyaWFsL2tnZGJv
Yy5jCj4gaW5kZXggODVmNmM1YTc2ZTBmZmY1NTZmODZmMGQ0NWViYzVhYWRmNWIxOTFlOC4uYWY2
ZDIyMDhiOGRkYjgyZDYyZjMzMjkyYjAwNmIyOTIzNTgzYTBkMiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMKPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9j
LmMKPiBAQCAtNTc3LDcgKzU3Nyw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGtnZGJvY19lYXJseWNv
bl9pbml0KGNoYXIgKm9wdCkKPiAgICAgICAgIGNvbnNvbGVfbGlzdF9sb2NrKCk7Cj4gICAgICAg
ICBmb3JfZWFjaF9jb25zb2xlKGNvbikgewo+ICAgICAgICAgICAgICAgICBpZiAoY29uLT53cml0
ZSAmJiBjb24tPnJlYWQgJiYKPiAtICAgICAgICAgICAgICAgICAgIChjb24tPmZsYWdzICYgKENP
Tl9CT09UIHwgQ09OX0VOQUJMRUQpKSAmJgo+ICsgICAgICAgICAgICAgICAgICAgKGNvbi0+Zmxh
Z3MgJiBDT05fQk9PVCkgJiYKPiArICAgICAgICAgICAgICAgICAgICgoY29uLT5mbGFncyAmIENP
Tl9TVVNQRU5ERUQpID09IDApICYmCgpJIGhhdmVuJ3QgdHJpZWQgcnVubmluZyB0aGUgY29kZSwg
c28gSSBjb3VsZCBlYXNpbHkgYmUgbWlzdGFrZW4sIGJ1dC4uLgoKLi4udGhlIGFib3ZlIGRvZXNu
J3Qgc2VlbSBsaWtlIHRoZSBjb3JyZWN0IGNvbnZlcnNpb24uIFRoZSBvbGQgZXhwcmVzc2lvbiB3
YXM6CgooY29uLT5mbGFncyAmIChDT05fQk9PVCB8IENPTl9FTkFCTEVEKSkKClRoYXQgd291bGQg
ZXZhbHVhdGUgdG8gbm9uLXplcm8gKHRydWUpIGlmIHRoZSBjb25zb2xlIHdhcyBfZWl0aGVyXwoi
Ym9vdCIgb3IgImVuYWJsZWQiLgoKVGhlIG5ldyBleHByZXNzaW9uIGlzIGlzOgoKKGNvbi0+Zmxh
Z3MgJiBDT05fQk9PVCkgJiYgKChjb24tPmZsYWdzICYgQ09OX1NVU1BFTkRFRCkgPT0gMCkKClRo
YXQncyBvbmx5IHRydWUgaWYgdGhlIGNvbnNvbGUgaXMgX2JvdGhfICJib290IiBhbmQgIm5vdCBz
dXNwZW5kZWQiLgoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
