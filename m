Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8790D5C2
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 16:44:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJa42-0003Dm-7I
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 14:44:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJa40-0003Dd-S2
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 14:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Zq4WUZA9GuHMC/0cNFmA/OUlKHldacJDbVJ/hibF2g=; b=eIDS/vUgJNIwod0VJ9PqFO+RV7
 G5YwuFqdKQ82vrjXvicHiSgNniliWYF69NrNyy/aePcY0Bm2Y5JWk3jUcDmNn6N9Uvjkk1Zk6G3DH
 9zJGGDrlwgnVaRK/di1JezDAT+JGQqjPudJA5Zd53be0ujSqXJZMiqpI9Tuz7bb6CdEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Zq4WUZA9GuHMC/0cNFmA/OUlKHldacJDbVJ/hibF2g=; b=Wm8bggEHA7X8956l8151/H5PV0
 jIhtUbkoqkjm/3MEXx0HwdySskJhcq6M0+7szMtrieN+Iywk6hDZPULSnc3FU1MBGNzNK5g1VN6QO
 Kwi4dlJBEGpyvq63Pid1XmPmoFUcNefrz6njPbZ+BKNkvc1KaBMqTaIPOoDqExcjWYjE=;
Received: from mail-qv1-f51.google.com ([209.85.219.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJa42-0005hi-03 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 14:44:01 +0000
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6adc63c2ee0so21220526d6.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718721835; x=1719326635;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Zq4WUZA9GuHMC/0cNFmA/OUlKHldacJDbVJ/hibF2g=;
 b=RwW20/fp4wfRaINCkSwyawGJAlj08PN5DpJj+5Y1ayInZRebeolWaYpRHjDyQk3Bzh
 TrWiQED67BffLPsER/9KTSBkp7WK2Jze7fYWDRj7RO3utf609IPyTfUqRnp1jf/m75ky
 3ZLMQyMbOKg7ZwhUSfh/7hDn6ppV6kUUKaQtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718721835; x=1719326635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Zq4WUZA9GuHMC/0cNFmA/OUlKHldacJDbVJ/hibF2g=;
 b=s0+A1xs6NE7P/ou5HmVmL0z4DdEzhyveKAygvgV6lcQ3vK8NYancYuLSllMW07huKg
 75VI9mVjNAl/keoD67Z57+BTCmEWhGjQsIegpg+ZlFEcWHlCIyRWRnr3WdYtKTJuXuxJ
 Cgcn7SI6mZs+qYBB20TZVwjjSBsUOTzOeXfFMBlYvIDSwmpfRK9bshgEUW+9ZRUOp6ZP
 iOcthRypisZUR6iarTzr0V4a0cHpIQPkwK/QP/CcVhacZCKogoc1Get+uvWmfqK09qWy
 j2yr9pw/WSCUuis5V6FuHscPau6TXm38ngC3tCkQjdpv3UkRf94Cud0OY4felqJdqQlm
 Bqyg==
X-Gm-Message-State: AOJu0YwcHfkEV0ov7FX9Y+1ke61QjpBBKbwc0AHZkfMQywzHedg8LUrC
 NKnePlc7s1l3RJQuqXdg5r+5BcOnsQNmV8N4Vuyw4rIyYK0AjqcYdoHx23FWzcG+h5g+v/9ZtoE
 =
X-Google-Smtp-Source: AGHT+IF9ZykKXeaTsJfliQkVyuyjVNYbAUpvZut1wBzBkIWWdO/sBCPSr7dFDxHY/s1a2vpttAj6Gg==
X-Received: by 2002:a0c:fe49:0:b0:6b2:d4d4:858a with SMTP id
 6a1803df08f44-6b2d4d4864amr63091196d6.38.1718721834906; 
 Tue, 18 Jun 2024 07:43:54 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5c3009csm66807616d6.62.2024.06.18.07.43.54
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 07:43:54 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-44056f72257so383701cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 07:43:54 -0700 (PDT)
X-Received: by 2002:a05:622a:13d2:b0:444:a760:55de with SMTP id
 d75a77b69052e-444a760572amr130461cf.24.1718721833609; Tue, 18 Jun 2024
 07:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.7.Ie8aa2af2df12c2e9dc510f003a301401a1ac97fb@changeid>
 <20240618125710.GE11330@aspen.lan>
In-Reply-To: <20240618125710.GE11330@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 07:43:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WY18ROK6pnF4DviGrTAJDd_YbR5T0MAoTR4w1_+xCeTg@mail.gmail.com>
Message-ID: <CAD=FV=WY18ROK6pnF4DviGrTAJDd_YbR5T0MAoTR4w1_+xCeTg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, Jun 18, 2024 at 5:57 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Mon, Jun 17, 2024 at 05:34:41PM -0700, Douglas Anderson wrote:
    > > In general, "md"-style commands are mean [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.219.51 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.51 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.51 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJa42-0005hi-03
Subject: Re: [Kgdb-bugreport] [PATCH 07/13] kdb: Tweak "repeat" handling
 code for "mdW" and "mdWcN"
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
 Thorsten Blum <thorsten.blum@toblux.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIEp1biAxOCwgMjAyNCBhdCA1OjU34oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAy
NCBhdCAwNTozNDo0MVBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gSW4gZ2Vu
ZXJhbCwgIm1kIi1zdHlsZSBjb21tYW5kcyBhcmUgbWVhbnQgdG8gYmUgInJlcGVhdGVkIi4gVGhp
cyBpcyBhCj4gPiBmZWF0dXJlIG9mIGtkYiBhbmQgIm1kIi1zdHlsZSBjb21tYW5kcyBnZXQgaXQg
ZW5hYmxlZCBiZWNhdXNlIHRoZXkKPiA+IGhhdmUgdGhlIGZsYWcgS0RCX1JFUEVBVF9OT19BUkdT
LiBXaGF0IHRoaXMgbWVhbnMgaXMgdGhhdCBpZiB5b3UgdHlwZQo+ID4gIm1kNGMyIDB4ZmZmZmZm
ODA4ZWYwNTQwMCIgYW5kIHRoZW4ga2VlcCBoaXR0aW5nIHJldHVybiBvbiB0aGUgImtkYj4iCj4g
PiBwcm9tcHQgdGhhdCB5b3UnbGwgcmVhZCBtb3JlIGFuZCBtb3JlIG1lbW9yeS4gRm9yIGluc3Rh
bmNlOgo+ID4gICBbNV1rZGI+IG1kNGMyIDB4ZmZmZmZmODA4ZWYwNTQwMAo+ID4gICAweGZmZmZm
ZjgwOGVmMDU0MDAgMDAwMDAyMDQgMDAwMDAwMDAgICAgICAgICAgICAgICAgICAgICAuLi4uLi4u
Lgo+ID4gICBbNV1rZGI+Cj4gPiAgIDB4ZmZmZmZmODA4ZWYwNTQwOCA4MjM1ZTAwMCAwMDAwMDAw
MCAgICAgICAgICAgICAgICAgICAgIC4uNS4uLi4uCj4gPiAgIFs1XWtkYj4KPiA+ICAgMHhmZmZm
ZmY4MDhlZjA1NDEwIDAwMDAwMDAzIDAwMDAwMDAxICAgICAgICAgICAgICAgICAgICAgLi4uLi4u
Li4KPiA+Cj4gPiBBcyBhIHNpZGUgZWZmZWN0IG9mIHRoZSB3YXkga2RiIHdvcmtzIGlzIGltcGxl
bWVudGVkLCB5b3UgY2FuIGdldCB0aGUKPiA+IHNhbWUgYmVoYXZpb3IgYXMgdGhlIGFib3ZlIGJ5
IHR5cGluZyB0aGUgY29tbWFuZCBhZ2FpbiB3aXRoIG5vCj4gPiBhcmd1bWVudHMuIFRob3VnaCBp
dCBzZWVtcyB1bmxpa2VseSBhbnlvbmUgd291bGQgZG8gdGhpcyBpdCBzaG91bGRuJ3QKPiA+IHJl
YWxseSBodXJ0Ogo+ID4gICBbNV1rZGI+IG1kNGMyIDB4ZmZmZmZmODA4ZWYwNTQwMAo+ID4gICAw
eGZmZmZmZjgwOGVmMDU0MDAgMDAwMDAyMDQgMDAwMDAwMDAgICAgICAgICAgICAgICAgICAgICAu
Li4uLi4uLgo+ID4gICBbNV1rZGI+IG1kNGMyCj4gPiAgIDB4ZmZmZmZmODA4ZWYwNTQwOCA4MjM1
ZTAwMCAwMDAwMDAwMCAgICAgICAgICAgICAgICAgICAgIC4uNS4uLi4uCj4gPiAgIFs1XWtkYj4g
bWQ0YzIKPiA+ICAgMHhmZmZmZmY4MDhlZjA1NDEwIDAwMDAwMDAzIDAwMDAwMDAxICAgICAgICAg
ICAgICAgICAgICAgLi4uLi4uLi4KPiA+Cj4gPiBJbiBnZW5lcmFsIHN1cHBvcnRpbmcgInJlcGVh
dCIgc2hvdWxkIGJlIGVhc3kuIElmIGFyZ2MgaXMgMCB0aGVuIHdlCj4gPiBqdXN0IGNvcHkgdGhl
IHJlc3VsdHMgb2YgdGhlIGFyZyBwYXJzaW5nIGZyb20gdGhlIGxhc3QgdGltZSwgbWFraW5nCj4g
PiBzdXJlIHRoYXQgdGhlIGFkZHJlc3MgaGFzIGJlZW4gdXBkYXRlZC4gVGhpcyBpcyBhbGwgaGFu
ZGxlZCBuaWNlbHkgaW4KPiA+IHRoZSAiaWYgKGFyZ2MgPT0gMCkiIGNsYXVzZSBpbiBrZGJfbWQo
KS4KPiA+Cj4gPiBPZGRseSwgdGhlICJtZFciIGFuZCAibWRXY04iIGNvZGUgc2VlbXMgdG8gdXBk
YXRlICJsYXN0X2J5dGVzcGVyd29yZCIKPiA+IGFuZCAibGFzdF9yZXBlYXQiLCB3aGljaCBkb2Vz
bid0IHNlZW0gbGlrZSBpdCBzaG91bGQgYmUgbmVjZXNzYXJ5LiBJdAo+ID4gYXBwZWFycyB0aGF0
IHRoaXMgY29kZSBpcyBuZWVkZWQgdG8gbWFrZSB0aGlzIHVzZSBjYXNlIHdvcmssIHRob3VnaAo+
ID4gaXQncyBhIGJpdCB1bmNsZWFyIGlmIHRoaXMgaXMgdHJ1bHkgYW4gaW1wb3J0YW50IGZlYXR1
cmUgdG8gc3VwcG9ydDoKPiA+ICAgWzFda2RiPiBtZDJjMyAweGZmZmZmZjgwYzhlMmIyODAKPiA+
ICAgMHhmZmZmZmY4MGM4ZTJiMjgwIDAyMDAgMDAwMCAwMDAwICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC4uLgo+ID4gICBbMV1rZGI+IG1kMmM0Cj4gPiAgIDB4ZmZmZmZmODBjOGUyYjI4NiAw
MDAwIGUwMDAgODIzNSAwMDAwICAgICAgICAgICAgICAgICAgICAgICAuLi4KPiA+Cj4gPiBJbiBv
cmRlciB0byBhYnN0cmFjdCB0aGUgY29kZSBiZXR0ZXIsIHJlbW92ZSB0aGUgY29kZSB1cGRhdGlu
Zwo+ID4gImxhc3RfYnl0ZXNwZXJ3b3JkIiBhbmQgImxhc3RfcmVwZWF0IiBmcm9tIHRoZSAibWRX
IiBhbmQgIm1kV2NOIgo+ID4gaGFuZGxpbmcuIFRoaXMgYnJlYWtzIHRoZSBhYm92ZSBjYXNlIHdo
ZXJlIHRoZSB1c2VyIHR3ZWFrZWQgImFyZ3ZbMF0iCj4gPiBhbmQgdGhlbiB0cmllZCB0byBzb21l
aG93IGxldmVyYWdlIHRoZSAicmVwZWF0IiBjb2RlIHRvIGRvIHNvbWV0aGluZwo+ID4gc21hcnQs
IGJ1dCB0aGF0IGZlZWxzIGxpa2UgaXQgd2FzIGEgbWlzZmVhdHVyZSBhbnl3YXkuCj4KPiBJJ20g
bm90IHRvbyBrZWVuIG9uICJzdWNjZXNzZnVsbHkiIGRvaW5nIHRoZSB3cm9uZyB0aGluZy4KPgo+
IEluIHRoYXQgbGlnaHQgSSdkIHZpZXcgdGhpcyBhcyBhIGZlYXR1cmUgdGhhdCBpcyBhcmd1YWJs
eSBzaW1wbGVyIHRvCj4gaW1wbGVtZW50IHRoYW4gaXQgaXMgdG8gZXJyb3IgY2hlY2sgKm5vdCog
aW1wbGVtZW50aW5nIGl0LiBJbiBvdGhlcgo+IHdvcmRzIGJ5IHRoZSB0aW1lIHlvdSBhZGQgZXJy
b3IgY2hlY2tpbmcgdG8gdGhlIGFyZ2MgPT0gMCBwYXRoIHRvCj4gc3BvdCBtaXNtYXRjaGVzIHRo
ZW4geW91IGFyZSBiZXR0ZXIgb2ZmIGhvbm91cmluZyB0aGUgdXNlciByZXF1ZXN0Cj4gcmF0aGVy
IHRoZW4gdGVsbGluZyB0aGVtIHRoZXkgZ290IGl0IHdyb25nLgoKSG1tbS4gSG93IGFib3V0IHdl
IHN0b3JlIHRoZSBsYXN0ICJhcmd2MCIgYW5kIHdlIGp1c3QgaW1tZWRpYXRlbHkgZmFpbAppZiAi
YXJnYyA9PSAwIiBhbmQgImFyZ3ZbMF0iIGRvZXNuJ3QgbWF0Y2ggdGhlIHByZXZpb3VzIG9uZT8K
ClRoZSBvdmVycmlkZSBydWxlcyBmb3IgbGluZXMgLyB3b3JkIGNvdW50IGlzIGFscmVhZHkgY29t
cGxpY2F0ZWQKZW5vdWdoIGFuZCBteSBoZWFkIHdhcyBzcGlubmluZyB0cnlpbmcgdG8gZ2V0IHRo
aXMgcmlnaHQgYW5kIHJlYXNvbgphYm91dCBpdC4gSSB0cmllZCBzZXZlcmFsIHRpbWVzIGFuZCBl
YWNoIHRpbWUgSSB0aG91Z2h0IEkgaGFkIGl0CndvcmtpbmcgY2xlYW5seSBJIGVuZGVkIHVwIHdp
dGggc29tZSBvdGhlciB3ZWlyZCBjb3JuZXIgY2FzZSB0aGF0IHdhcwpicm9rZW4uIEZvciBpbnN0
YW5jZSwgd2l0aCB0aGUgY3VycmVudCBjb2RlIHRoaXMgY2FzZSBpcyBicm9rZW4gKElNTyk6Cgpb
M11rZGI+IG1kMmM0IDB4ZmZmZjAwMDBkODk0ODA0MAoweGZmZmYwMDAwZDg5NDgwNDAgMDIwNCAw
MDAwIDAwMDAgMDAwMCAgICAgICAgICAgICAgICAgICAgICAgLi4uLi4uLi4KWzNda2RiPiBtZDIK
MHhmZmZmMDAwMGQ4OTQ4MDQ4IDMwMDAgODI0ZiAwMDAwIDAwMDAgMDAwMyAwMDAwIDAwMDEgMDAw
MCAgIC4wTy4uLi4uLi4uLi4uLi4KMHhmZmZmMDAwMGQ4OTQ4MDU4IDAwMDMgMDAwMCAwMDAwIDAw
MDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgIC4uLi4uLi4uLi4uLi4uLi4KMHhmZmZmMDAwMGQ4OTQ4
MDY4IDgwMDAgODg0YSA4MDAwIGZmZmYgMDAwMSAwMDAwIDAxMDAgMDA0MCAgIC4uSi4uLi4uLi4u
Li4uQC4KMHhmZmZmMDAwMGQ4OTQ4MDc4IDAwMDAgMDAwMCAwMDAxIDAwMDAgMDAwMCAwMDAwIDAw
MDAgMDAwMCAgIC4uLi4uLi4uLi4uLi4uLi4KMHhmZmZmMDAwMGQ4OTQ4MDg4IDAwMzAgMDAwMCAw
MDAwIDAwMDAgMDAwYSAwMDAwIDAwMDAgMDAwMCAgIDAuLi4uLi4uLi4uLi4uLi4KMHhmZmZmMDAw
MGQ4OTQ4MDk4IGYwZTYgZmZmYiAwMDAwIDAwMDAgOTM0MCA4MDliIDAwMDAgZmZmZiAgIC4uLi4u
Li4uQC4uLi4uLi4KMHhmZmZmMDAwMGQ4OTQ4MGE4IDAwMDUgMDAwMCAwMDAzIDAwMDAgMDAwMSAw
MDAwIDAwNzggMDAwMCAgIC4uLi4uLi4uLi4uLnguLi4KMHhmZmZmMDAwMGQ4OTQ4MGI4IDAwNzgg
MDAwMCAwMDc4IDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAgIHguLi54Li4uLi4uLi4uLi4KClNw
ZWNpZmljYWxseSBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhlICJsYXN0IiB3b3JkY291bnQgdG8g
cGVyc2lzdCBidXQKaW5zdGVhZCBpdCBmZWxsIGJhY2sgdG8gdGhlIGRlZmF1bHQgbWRjb3VudC4g
TWF5YmUgdGhlIGFib3ZlIGlzIHJpZ2h0CmJ1dCBpdCdzIGRpc3RpbmN0bHkgbm9uLW9idmlvdXMu
CgoKPiBEYW5pZWwuCj4KPgo+IFBTIEkgaGF2ZSBuZXZlciBkb25lIHNvIGJ1dCBJIGFsc28gd29u
ZGVyZWQgaWYgaXQgaXMgcmVhc29uYWJsZSB0byB1c2UKPiAgICB0aGlzIGZlYXR1cmUgdG8gbWFu
dWFsbHkgZGVjb21wb3NlIHN0cnVjdHVyZXMuIEZvciBleGFtcGxlOgo+Cj4gICAgICBtZDFjMSBz
dHJ1Y3R1cmVfcG9pbnRlcjsgbWQxYzc7IG1kOGMxOyBtZDhjMTsgbWQyYzIKClN1cmUsIHlvdSBj
YW4gY29tZSB1cCB3aXRoIGNhc2VzIHdoZXJlIGl0IGNvdWxkIGJlIHVzZWZ1bCwgYnV0IGl0CmZl
ZWxzIGxpa2UgdGhlcmUgYXJlIG90aGVyIHdheXMgdG8gYWNjb21wbGlzaCB0aGUgc2FtZSB0aGlu
ZyB3LyBsZXNzCmNvbXBsZXhpdHkuCgoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1i
dWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
