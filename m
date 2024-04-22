Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8148AD958
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 01:52:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz3SX-00016I-9O
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 23:52:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rz3SW-00016B-M7
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 23:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3DOqaxMdms/qXRzuhL549SToyGg4i6A1dwMfsfdbbL8=; b=dvah6FtuY4y/bv3oh2yXwM/TSw
 FC5WZ6d1FfNJNRncUP+vOTRiImYSxhP6Cyt7gf4aE463k1CRJjWBLllmtqt7Kcjef0ZsGE9PDuSWa
 hTzItPEoacBlA0cPvYvYHC0cBK5iYkpObi1sFJNRWm+DsCImULhPGaE3vTA6iZwSdYYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3DOqaxMdms/qXRzuhL549SToyGg4i6A1dwMfsfdbbL8=; b=I4ZruKRcZm6VbAfy7ADF28qumg
 znBl5+3mF6P//UNCalznmL2QllxWcp6GGRfUGqPXl2m+4j0TA/QAxPBdTxuJ+4dpMdorymHaN7F12
 H6md1mMxRPYKoxjlEU/Xb8/PoGohCk/G3AFdadIC6l+IM6Jd1EOavqGvOk/STyrS7V24=;
Received: from mail-qv1-f52.google.com ([209.85.219.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz3SV-0003Sn-PJ for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 23:52:29 +0000
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-69b10c9cdf4so18933826d6.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713829942; x=1714434742;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3DOqaxMdms/qXRzuhL549SToyGg4i6A1dwMfsfdbbL8=;
 b=FcNIcrDDPSXslKJ+NK5z943lAHGWOEuEnFbKeVswgR+IvEriG+yUM/jCga1n9jFWK7
 lgKrlDx8Hx6xx3HfCDydDcrqcQKJMFi5az61/XCJIo9Mk3Gz9mT1M9m5s0YtjWZsYutx
 1CN6laRXAzNNKintEZPHMCHX7q5Si7Nsx0fZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713829942; x=1714434742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3DOqaxMdms/qXRzuhL549SToyGg4i6A1dwMfsfdbbL8=;
 b=AvEbdKcN7KbYZe9SP6w8Z26Q9xah7AIa5t6gxM8MbtTUV53JyOV/2dkQQc9axgH0dE
 Lp6YiUdckTBx71JM+DdAA5GTnxHTgwqe+WzywE0s4TOamwnvgl+QhhcA6i35qWuKJ2+A
 xD8boRw1MDZhd2GRV5m7r+WEQiSZrVWKGEjwSQvB4c7hmSGWUtQEFCzjvRHg7w1oY5mg
 1UUGPZdID6x36kmYgcXxgt9CB9nq297NcCJbXlXjSZ4ZIriK+F4+fz9kqavtQHYOWO4Y
 9gegFxFIypylf648A9cL3O1iWn/bd5RmFyOlXXaSizNONSA1krrRYv5kag4WyeC6V5tz
 XHxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPXcd+eD6W1X04kHiTbVtwaShBVs/5LCtbnjx0HCJ7pUTXw6PfAxcyQGPigqWD1Wtv5SpxrcxIpUo+sdy69ob63J+cDjsjw+8rWzGxu31j/SuMMJU=
X-Gm-Message-State: AOJu0YwPYPsdTL5X5cjJImYlFYCZ/CAUR/r7VYgbdLCMwcru3TEmj1RP
 qNVWdKHgx1BNtlLUma3AandkT7hiS4Gbte+I9gQa9+gB5YNFpN5Ba9Vm+ORSIc8vIjQIgHRkXLN
 ns9WU
X-Google-Smtp-Source: AGHT+IEBnWAqMLlGeT7HlhbpsCEDVtYmY0DbZhO9Lmts4EzyBosDD6nDbRmtT11IMvVVOjNGKQxJ5w==
X-Received: by 2002:a0c:cc0b:0:b0:699:125:8540 with SMTP id
 r11-20020a0ccc0b000000b0069901258540mr11474458qvk.60.1713829942196; 
 Mon, 22 Apr 2024 16:52:22 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 r7-20020a0c8d07000000b00691873a7748sm3543871qvb.128.2024.04.22.16.52.20
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 16:52:21 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-439b1c72676so101001cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 16:52:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV3Q7In5D94fy8+KmQEzz7PZnnWIDOfwKHwFRvsD3LJJwEDgTR2+6eI9JvZxlDOa4tOPxHcZeWlyHeE7chUSFiaVc+HP1vBx8rpBBfpBhTxfyKCvO0=
X-Received: by 2002:ac8:6682:0:b0:439:891f:bbd2 with SMTP id
 d2-20020ac86682000000b00439891fbbd2mr122734qtp.28.1713829940394; Mon, 22 Apr
 2024 16:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-2-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-2-ed51f7d145fe@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 16:52:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXFHqOatn3cvwvYCey53+zuzB7ie4gYdvDVbfGL=Qm1Q@mail.gmail.com>
Message-ID: <CAD=FV=VXFHqOatn3cvwvYCey53+zuzB7ie4gYdvDVbfGL=Qm1Q@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Apr 22, 2024 at 9:37 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > Currently when kdb_read() needs to reposition the cursor it uses
    copy and > paste code that works by injecting [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.219.52 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.52 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rz3SV-0003Sn-PJ
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/7] kdb: Use format-strings rather
 than '\0' injection in kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEFwciAyMiwgMjAyNCBhdCA5OjM34oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBDdXJyZW50bHkgd2hlbiBrZGJf
cmVhZCgpIG5lZWRzIHRvIHJlcG9zaXRpb24gdGhlIGN1cnNvciBpdCB1c2VzIGNvcHkgYW5kCj4g
cGFzdGUgY29kZSB0aGF0IHdvcmtzIGJ5IGluamVjdGluZyBhbiAnXDAnIGF0IHRoZSBjdXJzb3Ig
cG9zaXRpb24gYmVmb3JlCj4gZGVsaXZlcmluZyBhIGNhcnJpYWdlLXJldHVybiBhbmQgcmVwcmlu
dGluZyB0aGUgbGluZSAod2hpY2ggc3RvcHMgYXQgdGhlCj4gJ1wwJykuCj4KPiBUaWR5IHVwIHRo
ZSBjb2RlIGJ5IGhvaXN0aW5nIHRoZSBjb3B5IGFuZCBwYXN0ZSBjb2RlIGludG8gYW4gYXBwcm9w
cmlhdGVseQo+IG5hbWVkIGZ1bmN0aW9uLiBBZGRpdGlvbmFsbHkgbGV0J3MgcmVwbGFjZSB0aGUg
J1wwJyBpbmplY3Rpb24gd2l0aCBhCj4gcHJvcGVyIGZpZWxkIHdpZHRoIHBhcmFtZXRlciBzbyB0
aGF0IHRoZSBzdHJpbmcgd2lsbCBiZSBhYnJpZGdlZCBkdXJpbmcKPiBmb3JtYXR0aW5nIGluc3Rl
YWQuCj4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIE5vdCBhIGJ1ZyBmaXggYnV0IGl0
IGlzIG5lZWRlZCBmb3IgbGF0ZXIgYnVnIGZpeGVzCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFRo
b21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiAtLS0KPiAga2VybmVsL2RlYnVn
L2tkYi9rZGJfaW8uYyB8IDM0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKTG9va3Mg
bGlrZSBhIG5pY2UgZml4LCBidXQgSSB0aGluayB0aGlzJ2xsIGNyZWF0ZSBhIGNvbXBpbGUgd2Fy
bmluZyBvbgpzb21lIGNvbXBpbGVycy4gVGhlIHZhcmlhYmxlICJ0bXAiIGlzIG5vIGxvbmdlciB1
c2VkLCBJIHRoaW5rLgoKT25jZSB0aGUgInRtcCIgdmFyaWFibGUgaXMgZGVsZXRlZCwgZmVlbCBm
cmVlIHRvIGFkZCBteSBSZXZpZXdlZC1ieS4KCk5PVEU6IHBhdGNoICM3IGluIHlvdXIgc2VyaWVz
IHJlLWFkZHMgYSB1c2VyIG9mICJ0bXAiLCBidXQgc2luY2UgdGhpcwpvbmUgaXMgIkNjOiBzdGFi
bGUiIHlvdSB3aWxsIG5lZWQgdG8gZGVsZXRlIGl0IGhlcmUgYW5kIHRoZW4gcmUtYWRkIGl0Cmlu
IHBhdGNoICM3LgoKCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMgYi9r
ZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCj4gaW5kZXggMDZkZmJjY2IxMDMzNi4uYTQyNjA3ZTRk
MWFiYSAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCj4gKysrIGIva2Vy
bmVsL2RlYnVnL2tkYi9rZGJfaW8uYwo+IEBAIC0xODQsNiArMTg0LDEzIEBAIGNoYXIga2RiX2dl
dGNoYXIodm9pZCkKPiAgICAgICAgIHVucmVhY2hhYmxlKCk7Cj4gIH0KPgo+ICtzdGF0aWMgdm9p
ZCBrZGJfcG9zaXRpb25fY3Vyc29yKGNoYXIgKnByb21wdCwgY2hhciAqYnVmZmVyLCBjaGFyICpj
cCkKPiArewo+ICsgICAgICAga2RiX3ByaW50ZigiXHIlcyIsIGtkYl9wcm9tcHRfc3RyKTsKPiAr
ICAgICAgIGlmIChjcCA+IGJ1ZmZlcikKPiArICAgICAgICAgICAgICAga2RiX3ByaW50ZigiJS4q
cyIsIChpbnQpKGNwIC0gYnVmZmVyKSwgYnVmZmVyKTsKCm5pdDogcGVyc29uYWxseSwgSSdkIHRh
a2UgdGhlICJpZiIgc3RhdGVtZW50IG91dC4gSSdtIG5lYXJseSBjZXJ0YWluCnRoYXQga2RiX3By
aW50ZigpIGNhbiBoYW5kbGUgemVyby1sZW5ndGggZm9yIHRoZSB3aWR0aCBhcmd1bWVudCBhbmQK
ImJ1ZmZlciIgY2FuIG5ldmVyIGJlIF9hZnRlcl8gY3AgKHNvIHlvdSBjYW4ndCBnZXQgbmVnYXRp
dmUpLgoKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9rZ2RiLWJ1Z3JlcG9ydAo=
