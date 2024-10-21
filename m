Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CCF9A712A
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 21 Oct 2024 19:37:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t2wLd-0006Et-RB
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 21 Oct 2024 17:37:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t2wLc-0006El-N1
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 21 Oct 2024 17:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsib8brj04kt5t31GVl9YzoyI3Dha46Vq2MQ+TRkJE8=; b=jP8YD122Ys3lV5VUvACLYQYqti
 pKAAe+C1xMiBV3aOdp6sV8g0GGRhBUtankz3XhuNSyPxSmmke1EHQdTi7aZKrg9Cbk0/0McLiY6d5
 IcvdOi6wHQOSa4w7DXy7PfPoyvRodn9oY6lo/sP+LPRx2vqO+cn7fSR/oQswIOWvrOdc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qsib8brj04kt5t31GVl9YzoyI3Dha46Vq2MQ+TRkJE8=; b=SeotG5lJ2qgMhhFftH1XHZfGE3
 8sjHEJ4ACbyFOlX65/9I2FH4HeelT5d1U388NdZ0PAlO1+WNyDF5KKOMxi6/OfFabYugJdZW0hWNv
 xwGpvWwMSjNB669ruyTCK0jV3bxeDRIuDzoL6jNQKKx8wpm5nPnMnxVQieHAX+lHY9xA=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t2wLc-00033z-1P for kgdb-bugreport@lists.sourceforge.net;
 Mon, 21 Oct 2024 17:37:40 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5cb6ca2a776so1263816a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Oct 2024 10:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729532248; x=1730137048;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qsib8brj04kt5t31GVl9YzoyI3Dha46Vq2MQ+TRkJE8=;
 b=UJn3+qygDs/knb/0Pa4SPlDUTowma8cSAqXmZmxyrLIDbx4F3y1A4V4GbvEjqchWkn
 kEkfkK5E5bhPUoNoOjM+c8Slq8yZDiKhPPV/rzoW6dKfWOoFHKwi4nBqFA3cgclyBoBM
 D3S6NYjYZOhfbAkw7kQaTltPjWfBpBboI5/0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729532248; x=1730137048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qsib8brj04kt5t31GVl9YzoyI3Dha46Vq2MQ+TRkJE8=;
 b=jBNPhkhKrn11h8IKbb9JTARW++0zZUDrBbEdFceZMt5gEbhgE8SVkz7rwwJBEE1DLR
 zlAHpOnwIqDaBaKBxsZL/xnCqJ3f3g3FNOLxeo9tKpa2TomZ7LXCMOOFa1KIWY+XeJka
 6ecw0xo6U3WVGYidgXul/hSiKDBffezZ6PuRc6Rt3qJ2NjTipkXdxK3hZXcEttHcBQgi
 gwx4OM3wyKcmOT0qhszypJQRDy/VoqEPObbA4fI4jnwIp5Ka6BU4Au5uZXPbAuLtHD+1
 /0o1dA+KgxazerlavAHDUpFSrfG3rLyJJ6Bp/22hDxJSB3rz/qOK0i56o1KmmSGb3V9f
 4AMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuZ/bHNHfdlf1F/SuB2yLdhK2JgbZNkk3RP00gxaxaGBYh7P6GTgSrSQEWyNxWBkWWmi18KX8PhvFt+O0f0A==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzrhNnF3L61XrKZ/8yDLEavuMzTob5rsxuwqc44pDQWFbUqWyHd
 pF8bE9HyHU71eDBs/oC4p33Z7WL0PXArDILxSWZ5MCt87VFL3mEiuBDICogg3M1UnuGhFd4T/Ho
 kVQ==
X-Google-Smtp-Source: AGHT+IEpbwr/c67pNOVnX+1Unm++994RU98rFTvmFJfJGIqLvjfN0/1cYleBx/JNOG8IwOhrCqpMNQ==
X-Received: by 2002:a05:6512:3e1e:b0:53a:44c:615a with SMTP id
 2adb3069b0e04-53b12c36b00mr370356e87.43.1729530872557; 
 Mon, 21 Oct 2024 10:14:32 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22420192sm522768e87.178.2024.10.21.10.14.31
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 10:14:31 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539f7606199so5233137e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Oct 2024 10:14:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAY4mJ69JM9x/ML9yRYVbTwJgVIEUNY+DoNOmzPepXHX3eEV1kmHB8DE/uybcY8UZEzSIzUJPtFa0M/oz4gA==@lists.sourceforge.net
X-Received: by 2002:a05:6512:31cb:b0:539:da76:4832 with SMTP id
 2adb3069b0e04-53b12c36b0bmr447752e87.37.1729530871219; Mon, 21 Oct 2024
 10:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241019195715.GA810861@lichtman.org>
 <20241019204212.GA811391@lichtman.org>
In-Reply-To: <20241019204212.GA811391@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Oct 2024 10:14:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UpKjTe78vexUXFThPXtx1KjhfR_u+1hpQpkh8ei-F5aA@mail.gmail.com>
Message-ID: <CAD=FV=UpKjTe78vexUXFThPXtx1KjhfR_u+1hpQpkh8ei-F5aA@mail.gmail.com>
To: Nir Lichtman <nir@lichtman.org>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Oct 19, 2024 at 1:42 PM Nir Lichtman <nir@lichtman.org>
    wrote: > > Problem: In many cases, KDB treats invalid commands as numbers
    and > instead of printing a usage error, goes ahead and just [...] 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t2wLc-00033z-1P
Subject: Re: [Kgdb-bugreport] [PATCH v2] KDB: Fix incorrect treatment of
 numbers in the CLI
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
Cc: kgdb-bugreport@lists.sourceforge.net, daniel.thompson@linaro.org,
 Yuran Pereira <yuran.pereira@hotmail.com>, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIE9jdCAxOSwgMjAyNCBhdCAxOjQy4oCvUE0gTmlyIExpY2h0bWFuIDxuaXJA
bGljaHRtYW4ub3JnPiB3cm90ZToKPgo+IFByb2JsZW06IEluIG1hbnkgY2FzZXMsIEtEQiB0cmVh
dHMgaW52YWxpZCBjb21tYW5kcyBhcyBudW1iZXJzIGFuZAo+IGluc3RlYWQgb2YgcHJpbnRpbmcg
YSB1c2FnZSBlcnJvciwgZ29lcyBhaGVhZCBhbmQganVzdCBwcmludHMgdGhlIG51bWJlcgo+IGlu
IGhleAo+Cj4gRXhhbXBsZTogVGhpcyBjYW4gYmUgZGVtb25zdHJhdGVkIHdoZW4gdHlwaW5nIGZv
ciBleGFtcGxlICJhYWF6enoiLCB0aGlzCj4gY29uZnVzZXMgS0RCIGludG8gdGhpbmtpbmcgdGhp
cyBpcyB0aGUgaGV4YWRlY2ltYWwgMHhBQUEKPgo+IFNvbHV0aW9uOiBUcmFuc2l0aW9uIHRvIHVz
aW5nIGtzdHJ0b3VsIGluc3RlYWQgb2Ygc2ltcGxlX3N0cnRvdWwuCj4gVGhpcyBmdW5jdGlvbiBp
cyBtb3JlIHN0cmljdCB3aXRoIHdoYXQgaXQgdHJlYXRzIGFzIGEgbnVtYmVyCj4gYW5kIHRodXMg
c29sdmVzIHRoZSBpc3N1ZS4KPiAoYWxzbyBiZXR0ZXIgcHJhY3RpY2UgYXMgc3RhdGVkIGluIHRo
ZSBkZWZpbml0aW9uIG9mIHNpbXBsZV9zdHJ0b3VsKS4KPgo+IHYyOiBSZW1vdmVkIHJlZHVuZGFu
dCBpZiBjb25kaXRpb24gSSBwdXQgaW4gdjEKPgo+IFNpZ25lZC1vZmYtYnk6IE5pciBMaWNodG1h
biA8bmlyQGxpY2h0bWFuLm9yZz4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5j
IHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jIGIva2Vy
bmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gaW5kZXggZjVmN2Q3ZmI1OTM2Li40Y2JkNWNkMjY4
MjEgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gKysrIGIva2Vy
bmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jCj4gQEAgLTQwMiwxOCArNDAyLDE1IEBAIHN0YXRpYyB2
b2lkIGtkYl9wcmludGVudih2b2lkKQo+ICAgKi8KPiAgaW50IGtkYmdldHVsYXJnKGNvbnN0IGNo
YXIgKmFyZywgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4gIHsKPiAtICAgICAgIGNoYXIgKmVuZHA7
Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHZhbDsKPgo+IC0gICAgICAgdmFsID0gc2ltcGxlX3N0
cnRvdWwoYXJnLCAmZW5kcCwgMCk7Cj4KPiAtICAgICAgIGlmIChlbmRwID09IGFyZykgewo+ICsg
ICAgICAgaWYgKGtzdHJ0b3VsKGFyZywgMCwgJnZhbCkgIT0gMCkgewo+ICAgICAgICAgICAgICAg
ICAvKgo+ICAgICAgICAgICAgICAgICAgKiBBbHNvIHRyeSBiYXNlIDE2LCBmb3IgdXMgZm9sa3Mg
dG9vIGxhenkgdG8gdHlwZSB0aGUKPiAgICAgICAgICAgICAgICAgICogbGVhZGluZyAweC4uLgo+
ICAgICAgICAgICAgICAgICAgKi8KPiAtICAgICAgICAgICAgICAgdmFsID0gc2ltcGxlX3N0cnRv
dWwoYXJnLCAmZW5kcCwgMTYpOwo+IC0gICAgICAgICAgICAgICBpZiAoZW5kcCA9PSBhcmcpCj4g
KyAgICAgICAgICAgICAgIGlmIChrc3RydG91bChhcmcsIDE2LCAmdmFsKSAhPSAwKQoKSW5zdGVh
ZCBvZiBqdXN0IGZpeGluZyB0aGUgb25lIGNhc2UsIGRvIHlvdSB3YW50IHRvIGp1c3QgdGFrZSBv
dmVyIHRoZQpvbGQgcGF0Y2ggc2VyaWVzIHRoYXQgdHJpZWQgdG8gZG8gYSBtb3JlIGNvbXBsZXRl
IGpvYjoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvR1YxUFIxME1CNjU2M0UwRjhEQjJEMzM1
QkQ5Q0ZFNEQzRThCNEFAR1YxUFIxME1CNjU2My5FVVJQUkQxMC5QUk9ELk9VVExPT0suQ09NLwoK
SSB0aGluayBpbiBnZW5lcmFsIHRoYXQgc2VyaWVzIGxvb2tlZCBnb29kIGJ1dCBqdXN0IGhhZCBh
IGZldyBuaXRzIG9uCml0LCBidXQgdGhlIGF1dGhvciAoWXVyYW4gUGVyZWlyYSkgbmV2ZXIgZm9s
bG93ZWQgdXAgd2l0aCBhIHYyLiBZb3UKY291bGQgdGFrZSB0aGF0IHNlcmllcywgZml4IHRoZSBu
aXRzLCBhZGQgeW91ciBzaWduZWQtb2ZmLWJ5LCBhbmQgcG9zdAphIHYyPwoKLURvdWcKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9y
dCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
