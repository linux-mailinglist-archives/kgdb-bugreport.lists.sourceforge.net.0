Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 458F089E4A9
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Apr 2024 22:49:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruIP8-00065N-AA
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Apr 2024 20:49:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <justinstitt@google.com>) id 1ruIOx-000648-EE
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Apr 2024 20:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8FBvT4U9jWO7n57wctvYSnbs8wWD3G7D/bsJH6yrak=; b=WfDWX4Qrn5wPVssMpo0c4EFYh5
 sO663S3hHx/874a+NYtDyXFRCbCYtd02fm8hnVPB9SQgcf+XMFcIG9JtEM4Q+chEf19y6rM2fQGDr
 xfWRzu+mB8T50BcOrPWt53Mq1zvNifxMKC8jW8WWXEywEYEnGq0xbE5SmexDBgIPMVzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8FBvT4U9jWO7n57wctvYSnbs8wWD3G7D/bsJH6yrak=; b=NAhxDACt1SeMXdBKC6detW8oFa
 6vrUSpLI2u7s7u5pkMJcrs16dZc3Ef2twjX4LkZ5fFom9JiHgFwCT4685f34A8mfbUOu24bU0yH+2
 1v4M0SeDLIUjp3NBGGvJWtjMvXHsCMLWa4V9QfQsemp5ShiQXpUNuHzjKwQvebtPQ3cA=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ruIOt-0002Fg-63 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Apr 2024 20:49:07 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56e477db7fbso5253998a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Apr 2024 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712695732; x=1713300532;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8FBvT4U9jWO7n57wctvYSnbs8wWD3G7D/bsJH6yrak=;
 b=GJ/+iqmla9LjvTlzAVyYMc8VKPpFOXOiCMR0e9tbTx6sxwQ1vJ2VRcDXhPZaHaiaHb
 SN44Ic3S4kQ6ectOQ6E+BZkw+HYjHoF+KBFES54QhRBcgv3WReBSJqVKrmSSlbN6ZL7g
 rtxC6u2IAyvwBOYa5GRg5DJpl40hojQSCHa3xN071mwaKwxvYuB5Rn7cChKap8m7/lhG
 Mn8Hznjtt7gRd8j3P/w1q8TLFicEstKK6YhKEydx+3G5YYmvSwDj7Is7jdNRAywCcla3
 Qid5wseCto1EYhuA1A6awX2+f/zrOmR+qTOqGhs4vcDWEG5HVNk2F3LnB28HzTDHH72E
 gDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712695732; x=1713300532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8FBvT4U9jWO7n57wctvYSnbs8wWD3G7D/bsJH6yrak=;
 b=s82lCfXC/tQZeWHTc11rUj+vu0DWjRcDJiPRdwKcWFWUdTf0jLs5TosidK5TCzD6Nd
 2+RnLY1IGa9O8tYLiWRCUuZKxMRHHBMe0KqCHL1CslFLRKGit+BJhBaYaqJTwkqNxsAT
 8MZfqVJGpH/cg8pqfvZIDYJm70RHxPrj525ax0MLVOIZh7BuWjg/m0CMG10qKghskaFk
 rbm/1zki4Rw1b488cDsJMht4JwsPmBqJz9seThB+USyBduGlgIb9clPcgAENqmv20KmV
 CYU/ffr46dGbeMSRqf3W1YEM7dusi/vMaO+4OI74e2mBU+x6u2NqkhCStw9NvBTCI+dO
 x2hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkoDNmEk0yDXpaX9hpOL1FslYIHary6xD6axXsE5CuhS8dllQCt8bw016qrjnrGj5rssDUmjguMwbvP/DV5rIkLin313s8JWP0Up/qAdzUQCr2x/s=
X-Gm-Message-State: AOJu0YyN4WHNGsrhPskGNR0xwFvEXaHZMorP6y0qbI6wPJLVrPVApScN
 4Zi4almSi54gJ/SLZWm0N1OY5I06zNDETizTCH5m87R3W4G/Su77NJ7rt7xrwtCrwyNTFSmu3Oy
 oWpdb6PA30vDklv9SnXGRy/ZPHeRfAa86zApy
X-Google-Smtp-Source: AGHT+IHmdRG/nFnqS9OEuLDhWFqseJucDLixYntzV9YZk7CKKlWhzUyPbXqLfCYRT3uZPpxDKB0xkdf/1sRhAlzoBmg=
X-Received: by 2002:a50:cddc:0:b0:56e:99e:1fac with SMTP id
 h28-20020a50cddc000000b0056e099e1facmr383240edj.39.1712695731585; Tue, 09 Apr
 2024 13:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240405-strncpy-kernel-debug-kdb-kdb_io-c-v2-1-d0bf595ab301@google.com>
 <20240405095144.GB2890893@aspen.lan>
 <CAFhGd8q99emm1SFJSs=L7Pn0A79vCtDHtTD5XUbVCNh=DDadaQ@mail.gmail.com>
 <20240409183558.GA7510@aspen.lan>
In-Reply-To: <20240409183558.GA7510@aspen.lan>
Date: Tue, 9 Apr 2024 13:48:38 -0700
Message-ID: <CAFhGd8qESuuifuHsNjFPR-Va3P80bxrw+LqvC8deA8GziUJLpw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, Apr 9, 2024 at 11:36 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > On Mon, Apr 08, 2024 at 05:46:42PM -0700, Justin Stitt wrote:
   > > On Fri, Apr 5, 2024 at 2:51 AM Daniel Thom [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.49 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1ruIOt-0002Fg-63
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: replace deprecated strncpy
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
From: Justin Stitt via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Justin Stitt <justinstitt@google.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIEFwciA5LCAyMDI0IGF0IDExOjM24oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciAwOCwgMjAy
NCBhdCAwNTo0Njo0MlBNIC0wNzAwLCBKdXN0aW4gU3RpdHQgd3JvdGU6Cj4gPiBPbiBGcmksIEFw
ciA1LCAyMDI0IGF0IDI6NTHigK9BTSBEYW5pZWwgVGhvbXBzb24KPiA+IDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
IGxlbl90bXAgPSBzdHJsZW4ocF90bXApOwo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBz
dHJuY3B5KGNwLCBwX3RtcCtsZW4sIGxlbl90bXAtbGVuICsgMSk7Cj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHN0cnNjcHkoY3AsIHBfdG1wK2xlbiwgbGVuX3RtcC1sZW4gKyAxKTsKPiA+
ID4KPiA+ID4gQWdhaW4sIEkgcmVhbGx5IGRvbid0IHRoaW5rIHRoZSB0aGlyZCBhcmd1bWVudCBw
cm92aWRlcyB0aGUgbnVtYmVyIG9mCj4gPiA+IGNoYXJhY3RlcnMgaW4gdGhlIGRlc3RpbmF0aW9u
IGJ1ZmZlci4KPiA+ID4KPiA+Cj4gPiBSaWdodCwgdGhlIHRoaXJkIGFyZ3VtZW50IGlzIHRoZSBs
ZW5ndGggb2YgdGhlICJyZW1haW5pbmciIGNoYXJhY3RlcnMKPiA+IGZyb20gdGhlIGNvbXBsZXRp
b24gcG9pbnQuCj4KPiBXaGljaCBpcyBub3QgaG93IHN0cnNjcHkoKSBpcyBkZXNpZ25lZCB0byBi
ZSB1c2VkLgo+Cj4KPiA+IGlmIHlvdSB0eXBlICJ0ZXMiIGFuZCBwcmVzcyB0YWIgdGhlbiBrYWxs
c3ltc19zeW1ib2xfY29tcGxldGUoKSB3aWxsCj4gPiBwb3B1bGF0ZSBwX3RtcCB3aXRoICJ0ZXN0
Ii4gUHJpb3IgdG8gcmVuZGVyaW5nIHRvIHRoZSB1c2VyLCBAY3AgcG9pbnRzCj4gPiB0byAicyIs
IHdlIG5lZWQgdG8gY2F0Y2ggdGhlIHVzZXIgdXAgYW5kIHByaW50IHRoZSByZXN0IG9mIHRoZSBz
eW1ib2wKPiA+IG5hbWUgc2luY2UgdGhleSd2ZSBhbHJlYWR5IHR5cGVkICJ0ZXMiIHdlIG9ubHkg
bmVlZCB0byBwcmludCBvdXQgInQiLgo+Cj4gSSdtIG1vcmUgY29uY2VybmVkIGFib3V0IHRoZSBj
YXNlIHdoZXJlIHlvdSBmaWxsIHRoZSBidWZmZXIgZW50aXJlbHkKPiB0aGVuIG1vdmUgdGhlIGN1
cnNvciBsZWZ0IHVudGlsIHlvdSBnZXQgdG8gdGhlIHRlcyBhbmQgdGhlbiBwcmVzcyBUYWIuCj4g
SSB0aGluayBhdCB0aGUgcG9pbnQgd2Ugd3JpdGUgdG9vIG1hbnkgYnl0ZXMgdG8gY3AuCj4KPgo+
ID4gbGVuX3RtcCBpcyB0aGUgbGVuZ3RoIG9mIHRoZSBlbnRpcmUgc3ltYm9sIHBhcnQgYXMgcmV0
dXJuZWQgYnkKPiA+IGthbGxzeW1zX3N5bWJvbF9jb21wbGV0ZSgpIGFuZCBsZW4gaXMgdGhlIGxl
bmd0aCBvZiBvbmx5IHRoZQo+ID4gdXNlci10eXBlZCBzeW1ib2wuIFRoZXJlZm9yZSwgdGhlIGFt
b3VudCBvZiByZW1haW5pbmcgY2hhcmFjdGVycyB0bwo+ID4gcHJpbnQgaXMgZ2l2ZW4gYnkgbGVu
X3RtcC1sZW4gKGFuZCArMSBmb3IgYSBOVUwtYnl0ZSkuCj4gPgo+ID4gU28sIHllYWgsIHlvdSdy
ZSByaWdodC4gVGhpcyBpc24ndCB0aGUgbGVuZ3RoIG9mIHRoZSBkZXN0aW5hdGlvbiBidXQgSQo+
ID4gZG9uJ3Qgc2VlIHdoeSB3ZSBjYW4ndCB1c2UgbWVtY3B5KCkgKG9yIHN0cnNjcHkoKSkgYW5k
IGhhdmUgdGhpcyBub3QKPiA+IGJlIGNvbnNpZGVyZWQgImJyb2tlbiIuIFRoZSBwb2ludGVyIGFy
aXRobWV0aWMgY2hlY2tzIG91dC4KPgo+IFRoZSBwcm9ibGVtIHdpdGggc3Vic3RpdHV0aW5nIHN0
cm5jcHkoKSB3aXRoIG1lbWNweSgpIGlzIHRoYXQgaXMgKm5vdCoKPiBvYnZpb3VzbHkgd3Jvbmcu
Li4gYnV0IGl0IGNvdWxkIGJlIHN1YnRseSB3cm9uZy4KPgo+IFdlIGNhbiBzZWUgdGhhdCB0aGUg
cGVyc29uIHdobyBvcmlnaW5hbGx5IHdyb3RlIHRoaXMgY29kZSBtYWRlIGEgcHJldHR5Cj4gc2Vy
aW91cyBtaXN0YWtlIHdpdGggc3RybmNweSgpIGFuZCB0aGUgdGhpcmQgYXJndW1lbnQgaWYgZ2Fy
YmFnZS4gSXQgaXMKPiB0aGVyZWZvcmUgaW1wb3J0YW50IHRvIGZpZ3VyZSBvdXQgd2hhdCB0aGUg
KmNvcnJlY3QqIHZhbHVlIGZvciBhcmd1bWVudAo+ICMzIHNob3VsZCBoYXZlIGJlZW4gKmJlZm9y
ZSogd2UgYXR0ZW1wdCB0byByZXBsYWNlIHN0cm5jcHkoKSB3aXRoCj4gYW55dGhpbmcuCj4KPiBU
cmFuc2Zvcm1pbmcgc29tZXRoaW5nIHdlIGtub3cgdG8gYmUgYnJva2VuIHdpdGhvdXQgZml4aW5n
IGl0IGZpcnN0Cj4gbWVhbnMgaXQgaXMgaW1wb3NzaWJsZSB0byBrbm93IGlmIHRoZSB0cmFuc2Zv
cm1hdGlvbiBpcyBjb3JyZWN0IG9yIG5vdC4KPiBIZW5jZSB0aGUgb3JpZ2luYWwgcXVlc3Rpb24s
IGhvdyBkbyB3ZSBrbm93IHRoZXJlIGlzIGVub3VnaCBzcGFjZQo+IGFmdGVyIGNwIHRvIHN0b3Jl
IHRoZSBzdHJpbmc/CgpHb3RjaGEsIEkgd2lsbCBmaW5kIHRpbWUgdG8gc2VyaW91c2x5IHJlZmFj
dG9yL3Jld3JpdGUgdGhpcyBmdW5jdGlvbgoob3IgYXQgdGhlIHZlcnkgbGVhc3QgdGhlIHRhYiBo
YW5kbGluZyBwYXJ0IG9mIGl0KS4KCkF0IHRoZSBlbmQgb2YgdGhlIGRheSwgdGhvdWdoLCBJIGp1
c3Qgd2FudCB0aGlzIHN0cm5jcHkoKSBnb25lLgoKPgo+Cj4gRGFuaWVsLgoKVGhhbmtzCkp1c3Rp
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGIt
YnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdy
ZXBvcnQK
