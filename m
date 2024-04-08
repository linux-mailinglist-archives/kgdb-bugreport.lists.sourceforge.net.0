Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C189BD2E
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Apr 2024 12:30:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rtmH8-000763-58
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 08 Apr 2024 10:30:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1rtmH4-00075s-2x
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Apr 2024 10:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zDrTyP2Vy4iVLI6V80x+ZoMCFhWQosP2tXbTa3RDay8=; b=S3pACVVblKCCDIpz+Vi2cjdvsy
 DiooG6e0Imke/h+FLbGFHSuNohPRfxa88wrE2AphBSrbUGNP5QShZOqamyegFyYIkUEJSD5B+UYZ+
 6fXXE6YeFyfTrMxazh9qXGwZEgLhnpO/y3aIUIlUz4RALZzLi0n+GRQhx0dC6eHSq6a4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zDrTyP2Vy4iVLI6V80x+ZoMCFhWQosP2tXbTa3RDay8=; b=Kf9rAx1wdBhY6uEOcBHi4PUC9Z
 jbwsYHk5ujcfPDEaB6Hm9pirbx/2ubKIuBqJvhocNv4Mptn1F5QqvxMUSSVRQ7pw3fDvxORxPC8wm
 k96s5DMX2+jI68LPQ+Cjm6dSGaGmSJqr4Whk+AETL65s5Z4Cg9bAwLfp2K6M8YLHvVRQ=;
Received: from mail-ej1-f43.google.com ([209.85.218.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rtmH1-0001yE-Nd for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Apr 2024 10:30:49 +0000
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a51ddc783e3so62731366b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Apr 2024 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712572236; x=1713177036; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDrTyP2Vy4iVLI6V80x+ZoMCFhWQosP2tXbTa3RDay8=;
 b=fZw7eNGOoN5fNFvmgnJSQC1HGxYqWYh2R+YF4tmrd+acxI1SN24opSFUc2dOz8zKY/
 R5t1FRDJXQQ/rXR4qsEhFRg9XWXRipWDroKgjUEJIzkble9bRWYsT3uZ2qItjRS1pxAq
 uaDLM9miaGWScyNcLdISyuIfHQo4pF4U9q/yksw9xa4R5zKNwbWnQi8uPaqrON/ZpbJ6
 5/+MVlf1lLqlroz6I3Lb47/AJPD5k0BZC2WpAdfHYvMkamI91C7fwJWVcZkVbY6Vyegy
 BvuW2UVRof6SzBqB9XxCsxbXY2fa+H9xd97eD6VEz2N4xR9K4wahWZAYppytkk8wU4gY
 5wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712572236; x=1713177036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDrTyP2Vy4iVLI6V80x+ZoMCFhWQosP2tXbTa3RDay8=;
 b=vBCj873AXO9Kc6i2gBtLa9u44xtD0b8arch9lYSFhvoejQypcriYi/QGL4mjoLxV4U
 HBhQubOeJ/ZVpvCm2ZzzG2hHzNzRIpcB1f4mwgQYzniay5Fj9hLxJEzh3SyWrzndbuPo
 esEj+EEQ2pBaG79OI66PiseUJ69uE6Zk7RKiYLgqwNwgmJ+a/m52T+O1nuGQqF4eEXtg
 UxA4rmqQb8M5O7E0bbmu/Qzek3mWoPeNwx7o0IR5NHIuIZMt7v4rfpoqmpekVtE3dmdV
 yjDaICgxxFfCtac5SlhpPJH/DYRQ4ChvEHVz6rZDsjpCMqqDSLv5paaIwT7e5pleIHkh
 Q4ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJfolF+Vg8TUflxyx6unmAut04QOmtQjXAZe9uZioy91JJfZRSqTg92YDLdluECQzM8t6nyVfhS1k5Hm+wU2Kw7JMKid23TswtrtUMDhgARcmf5rg=
X-Gm-Message-State: AOJu0Yy45Xe40n+LyNEgTziHzEi/FOm3fTUkT10+WOG8Cw/DekFC3LUF
 aKMoRDbuWdq2+6VJh/0VsYf1mG3MUGoQxY/ZVfO7fJFY0UcTCE5DSglfJtokGMDDpYsFaDpXXBX
 oWUaQhwM7/b9FPZ15GBy7gMPprws=
X-Google-Smtp-Source: AGHT+IHrzBrC48Lrtrj0shD3qgiyxsJ2BMGxhjJ541np4p2WV47+CJO76OS97mZZAM7ikNc4i6v64annsIx0/tuLNHw=
X-Received: by 2002:a17:906:f218:b0:a51:a676:db26 with SMTP id
 gt24-20020a170906f21800b00a51a676db26mr5349858ejb.21.1712572236205; Mon, 08
 Apr 2024 03:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <Zg3WicDB8m9am7dJ@surfacebook.localdomain>
 <20240408014453.1431652-1-liu.yeC@h3c.com>
In-Reply-To: <20240408014453.1431652-1-liu.yeC@h3c.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 8 Apr 2024 13:29:59 +0300
Message-ID: <CAHp75Vd3xAxmEEHHTXWvKYtieV+kUmP+L+tQGq30YDH9S2hc-w@mail.gmail.com>
To: LiuYe <liu.yeC@h3c.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 8, 2024 at 4:46 AM LiuYe wrote: > >Wed, Apr
   03, 2024 at 02:11:09PM +0800, ... > >Ouch. > >Please, read this > >https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages
    > >and modify the commit message accordingly. > > The example is t [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.43 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [andy.shevchenko[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.218.43 listed in wl.mailspike.net]
X-Headers-End: 1rtmH1-0001yE-Nd
Subject: Re: [Kgdb-bugreport] [PATCH V8] kdb: Fix the deadlock issue in KDB
 debugging.
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBcHIgOCwgMjAyNCBhdCA0OjQ24oCvQU0gTGl1WWUgPGxpdS55ZUNAaDNjLmNvbT4g
d3JvdGU6Cj4gPldlZCwgQXByIDAzLCAyMDI0IGF0IDAyOjExOjA5UE0gKzA4MDAsIGxpdS55ZWNA
aDNjLmNvbSBraXJqb2l0dGk6CgouLi4KCj4gPk91Y2guCj4gPlBsZWFzZSwgcmVhZCB0aGlzCj4g
Pmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3VibWl0dGlu
Zy1wYXRjaGVzLmh0bWwjYmFja3RyYWNlcy1pbi1jb21taXQtbWVzc2FnZXMKPiA+YW5kIG1vZGlm
eSB0aGUgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHkuCj4KPiBUaGUgZXhhbXBsZSBpcyB0aGUg
cHJpbnRvdXQgb2YgdGhlIGtlcm5lbCBsb2NrdXAgZGV0ZWN0aW9uIG1lY2hhbmlzbSwgd2hpY2gg
bWF5IGJlIGVhc2llciB0byB1bmRlcnN0YW5kLgo+IElmIG9yZ2FuaXplZCBhY2NvcmRpbmcgdG8g
dGhlIGZvcm1hdCBwcm92aWRlZCBpbiB0aGUgcHJldmlvdXMgbGluaywgc2hvdWxkIGl0IGJlIGFy
cmFuZ2VkIGFzIGZvbGxvd3M/CgpEbyB5b3UgdGhpbmsgYWxsIGxpbmVzIGFyZSBpbXBvcnRhbnQg
ZnJvbSB0aGlzPwpEbyB5b3UgdGhpbmsgeW91IGhhdmVuJ3QgZHJvcHBlZCBhbnl0aGluZyB1c2Vm
dWw/CgpJZiAieWVzIiBpcyB0aGUgYW5zd2VyIHRvIGJvdGggUXMsIHRoZW4gZ28gd2l0aCBpdCAo
YnV0IGF0IGxlYXN0IEkgc2VlCnRoYXQgZmlyc3Qgc2VlbXMgdG8gbWUgYXMgIm5vIiwgc29tZSBs
aW5lcyBhcmUgbm90IGltcG9ydGFudCkKCgo+IEV4YW1wbGU6Cj4gQlVHOiBzcGlubG9jayBsb2Nr
dXAgc3VzcGVjdGVkIG9uIENQVSMwLiBvd25lcl9jcHU6IDEKPiBDUFUxOiBDYWxsIFRyYWNlOgo+
IF9fc2NoZWR1bGUKPiBzY2hlZHVsZQo+IHNjaGVkdWxlX2hydGltZW91dF9yYW5nZV9jbG9jawo+
IG11dGV4X3VubG9jawo+IGVwX3NjYW5fcmVhZHlfbGlzdAo+IHNjaGVkdWxlX2hydGltZW91dF9y
YW5nZQo+IGVwX3BvbGwKPiB3YWtlX3VwX3EKPiBTeVNfZXBvbGxfd2FpdAo+IGVudHJ5X1NZU0NB
TExfNjRfZmFzdHBhdGgKPgo+IENQVTA6IENhbGwgVHJhY2U6Cj4gZHVtcF9zdGFjawo+IHNwaW5f
ZHVtcAo+IGRvX3Jhd19zcGluX2xvY2sKPiBfcmF3X3NwaW5fbG9jawo+IHRyeV90b193YWtlX3Vw
Cj4gd2FrZV91cF9wcm9jZXNzCj4gaW5zZXJ0X3dvcmsKPiBfX3F1ZXVlX3dvcmsKPiBxdWV1ZV93
b3JrX29uCj4ga2dkYm9jX3Bvc3RfZXhwX2hhbmRsZXIKPiBrZ2RiX2NwdV9lbnRlcgo+IGtnZGJf
aGFuZGxlX2V4Y2VwdGlvbgo+IF9fa2dkYl9ub3RpZnkKPiBrZ2RiX25vdGlmeQo+IG5vdGlmaWVy
X2NhbGxfY2hhaW4KPiBub3RpZnlfZGllCj4gZG9faW50Mwo+IGludDMKCi4uLgoKPiA+PiAgI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+Cj4gPj4gICNpbmNsdWRlIDxsaW51eC9zZXJpYWxfY29yZS5oPgo+ID4+ICsjaW5jbHVk
ZSA8bGludXgvaXJxX3dvcmsuaD4KPiA+Cj4gPlBsZWFzZSwga2VlcCBpdCBvcmRlcmVkICh3aXRo
IHZpc2libGUgY29udGV4dCB0aGlzIHNob3VsZCBnbyBhdCBsZWFzdCBiZWZvcmUKPiA+bW9kdWxl
LmgpLgo+Cj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIG5lZWRzIHRvIGJlIHBsYWNlZCBi
ZWZvcmUgbW9kdWxlLmguIFBsZWFzZSBleHBsYWluIGZ1cnRoZXIsIHRoYW5rIHlvdS4KCkFscGhh
YmV0aWNhbCBvcmRlciBoZWxwcyBsb25nLXRlcm0gbWFpbnRlbmFuY2UuIFllcywgSSBrbm93IHRo
YXQgaXQgaXMKbm90IF9mdWxseV8gc29ydGVkLCBidXQgZG9uJ3QgYWRkIG1vcmUgbWVzcyB0byBp
dC4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGlu
ZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
