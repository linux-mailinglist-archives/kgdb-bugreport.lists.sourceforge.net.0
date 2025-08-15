Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E564B2757E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 Aug 2025 04:13:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4a/emtlriiBMtxUTeZMAs7RRf39xsmRSLnKskxRXlpw=; b=dxwGSfnMZ5hLV0ryxF6tQ/8IIl
	A8KTLaKwHYNSE6ewTbKewxPW0xAm3fIQq9CBODijv1+7scSfstr/1Nh8wNCOGnB4GFqypdiI3QnjV
	BdSI9UWjCMI8OT/w3NcAPr6Yr/tdwUr7nSUztlNZr2chKZxWyYj+BE/3w5S3SRdkuumI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1umjwq-0006DQ-KW
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 15 Aug 2025 02:13:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1umjwo-0006DI-H4
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 15 Aug 2025 02:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=czq9Z+KET/jVXs/EzDrGbxQ/5L+K1L0esuJSVThSc10=; b=hikVMasl1za4cZ1fx12INA+X1m
 WcXwGBCRVU46jXhKFujQ11VHAY3mlgqWJzSJ/X716fz04syTTj/10MDW5CUHT3DDCu3oz4NIJvhj/
 gDlL29fBvSinNMfRlS2b/GaC76wclZ1Zu2qECypm522CI99RUx9GFN0ZsxBITqQlo0VI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=czq9Z+KET/jVXs/EzDrGbxQ/5L+K1L0esuJSVThSc10=; b=lI6HICa+vwZ6A33yyJd1ccGcU1
 mF9Ze4Pz8To4HzeslEPFDLFvFgLPyN6p51KqyQDlXA9RvzE5IBpSAxSCEHwrZ61Aef/3Yr8U/UWjd
 2WKFL3DqBhNPFRCrckmL2k4JFfR1mD239eY0oUfTegvAHNakmH+7aZxqRPV4v/nUpm/w=;
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1umjwo-0007io-15 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 15 Aug 2025 02:13:38 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-30cce5c7f1eso1367966fac.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 Aug 2025 19:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755224011; x=1755828811;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czq9Z+KET/jVXs/EzDrGbxQ/5L+K1L0esuJSVThSc10=;
 b=XzO4rAkJJLw6HBPbfIFKsi6K7twrsiWo4RxTYG6NLt5N+tBKR0oIFe6Avws5atOQBr
 u9q0nVLY+9Gkc0AxlygrlGDZnVhf+FJHsPKDaQiYCGy2YdD48cqci/VuWBWFcTZPYht7
 Kc/7m/Hg/TzV6MqxmmMMwy++B4zQ9yWudFHq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755224011; x=1755828811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czq9Z+KET/jVXs/EzDrGbxQ/5L+K1L0esuJSVThSc10=;
 b=UfSgB4OiJVvonqOXYz6M3UWoZXELVlclPZzIIayUrdxqvAIoOMhc7qX/Xdr/AEx7Sv
 0stzRem6e1xn39H59qx9ptCo8l4CTU+ytu+Wp/vE/0YfQflMNeblJZ56RRwImBA8WH/y
 uURmXrQmUJRlrzoliEQ4wR1nc9uTGW34I9gV/IHscmLVBrYHdFTfafSLD6WXrTsUTeRX
 FHn0qbC+8nm2WoDLEALrQj77A31rgVKxazSND/pUpktxp9CYQs16+slWPHNcVw51EglO
 s0UTNoBde8oav3sMEoMlfvE1teHHbeyG3X6ACkS3bV2OVNAm9DnOjJIFKhVuVRCriJyX
 vw1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtMuPLk4plCwUNeJFhwll8PekjW+75iamzphDMRf9v7ytt4IbOt+LHeFZ7lifeUhD5EIpkzTVyliKNv2BUxA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyIQpiD8Mccz0fqs/xZrVkJtzqdGjyudFjYwf0esJjot7NmGnfD
 f3hB34hgm8VcBUc9xFQJPiRZhx8rXwM2+RL9Z8MTntpSnVsX9XzyMK5ft0vs+csNETQK89coz+D
 XzsM=
X-Gm-Gg: ASbGncsYeWcsKM0FAovQ1pjXgJ/nB3d07CGzvtaou1Y6cW4JECSI38v13oj4/eWyUMx
 HhGDMraxTxqtpdSMzt5sloFo9rbFirtMjb+ife0oUgfGhyebn/TD2K0rn9CRi0+0ZOXNTXd8FKv
 xwYzRwsu0QX8AUZDMTZnvMQAQjLYiZ87l5xuV6P0z0G8gZNK7PcSO9TIgH8RBanKR9wFwxkNqXi
 2WK2tVbpdTFnqcnf9JZBJ96mCdFYGVM65gfTsCSMbE8AL3YMmxHHxLS1lQy+DMZWEAA+uG+15I2
 xknwMcqY4eju5AyF9TzbLVrPAcN7oNGrn+lvqO2YYt6yLdb8JGRHQVlP6inKbdF5KTZR/8HOGMt
 45vywU10j8h+UBfItBNmwAATafjXC8SfX5w6OsDx3LJ4ZzBjSPFLU092IdkQU0Tp6eg==
X-Google-Smtp-Source: AGHT+IGpIjvtkr63bdr9nxl2sNmJFpK+S6Kc7iuHbM3xhGfDEUbCF3KauqvfPR0l07uYxqtfkISyKA==
X-Received: by 2002:a17:902:cccb:b0:243:b81:ac14 with SMTP id
 d9443c01a7336-2446bd273c6mr8857155ad.11.1755223516275; 
 Thu, 14 Aug 2025 19:05:16 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com.
 [209.85.215.179]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d5637acsm2187815ad.143.2025.08.14.19.05.14
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 19:05:15 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b47052620a6so2045844a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 14 Aug 2025 19:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8pIcFcLwKs2bEQJqeMq7LEdcuiBLNGGlGvXQI5Bx9avUdkt08sqc6qqcoyo9GOyJWNMXCDvUm7FzbxygTCQ==@lists.sourceforge.net
X-Received: by 2002:a17:902:d50b:b0:242:b138:8110 with SMTP id
 d9443c01a7336-244598679d7mr74419825ad.24.1755223514160; Thu, 14 Aug 2025
 19:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250814220130.281187-2-thorsten.blum@linux.dev>
In-Reply-To: <20250814220130.281187-2-thorsten.blum@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 19:05:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Udf3pZjhpPxEuHsFynP7GoHnZ7RG=NYZ2gLzm=E_4V4A@mail.gmail.com>
X-Gm-Features: Ac12FXyz0N6lYfN0uKFzb67JigmIfAX8HYG9O649Ly1mqN7DuMLlThvvJiVlxQE
Message-ID: <CAD=FV=Udf3pZjhpPxEuHsFynP7GoHnZ7RG=NYZ2gLzm=E_4V4A@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Thu, Aug 14,
 2025 at 3:02 PM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > strcpy() is deprecated; use strscpy() and memcpy() instead and
 remove > several manual NUL-terminations. > > In parse [...] 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.47 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umjwo-0007io-15
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Replace deprecated strcpy()
 with strscpy() and memcpy()
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
 Daniel Thompson <danielt@kernel.org>, linux-hardening@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIEF1ZyAxNCwgMjAyNSBhdCAzOjAy4oCvUE0gVGhvcnN0ZW4gQmx1bSA8dGhv
cnN0ZW4uYmx1bUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gc3RyY3B5KCkgaXMgZGVwcmVjYXRlZDsg
dXNlIHN0cnNjcHkoKSBhbmQgbWVtY3B5KCkgaW5zdGVhZCBhbmQgcmVtb3ZlCj4gc2V2ZXJhbCBt
YW51YWwgTlVMLXRlcm1pbmF0aW9ucy4KPgo+IEluIHBhcnNlX2dyZXAoKSwgd2UgY2FuIHNhZmVs
eSB1c2UgbWVtY3B5KCkgYmVjYXVzZSB3ZSBhbHJlYWR5IGtub3cgdGhlCj4gbGVuZ3RoIG9mIHRo
ZSBzb3VyY2Ugc3RyaW5nICdjcCcgYW5kIHRoYXQgaXQgaXMgZ3VhcmFudGVlZCB0byBiZQo+IE5V
TC10ZXJtaW5hdGVkIHdpdGhpbiB0aGUgZmlyc3QgS0RCX0dSRVBfU1RSTEVOIGJ5dGVzLgo+Cj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIu
Y29tL0tTUFAvbGludXgvaXNzdWVzLzg4Cj4gU2lnbmVkLW9mZi1ieTogVGhvcnN0ZW4gQmx1bSA8
dGhvcnN0ZW4uYmx1bUBsaW51eC5kZXY+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIEV4dHJh
Y3QgdGhlIHN0cnNjcHkoKSBjaGFuZ2VzIGludG8gYSBzZXBhcmF0ZSBwYXRjaCBhbmQgZm9jdXMg
b24KPiAgIHJlcGxhY2luZyB0aGUgZGVwcmVjYXRlZCBzdHJjcHkoKSBjYWxscyBhcyBzdWdnZXN0
ZWQgYnkgR3JlZwo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDI1MDgxNDE2MzIzNy4yMjk1NDQtMi10aG9yc3Rlbi5ibHVtQGxpbnV4LmRldi8KPgo+IENoYW5n
ZXMgaW4gdjI6Cj4gLSBVc2UgbWVtY3B5KCkgaW5zdGVhZCBvZiBzdHJzY3B5KCkgaW4gcGFyc2Vf
Z3JlcCgpIGFzIHN1Z2dlc3RlZCBieSBHcmVnCj4gLSBDb21waWxlLXRlc3RlZCBvbmx5IHNvIGZh
cgo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDgxNDEy
MDMzOC4yMTk1ODUtMi10aG9yc3Rlbi5ibHVtQGxpbnV4LmRldi8KPiAtLS0KPiAga2VybmVsL2Rl
YnVnL2tkYi9rZGJfbWFpbi5jIHwgMTQgKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9rZXJuZWwv
ZGVidWcva2RiL2tkYl9tYWluLmMgYi9rZXJuZWwvZGVidWcva2RiL2tkYl9tYWluLmMKPiBpbmRl
eCA3YTRkMmQ0Njg5YTUuLjQwZGUwZWNlNzI0YiAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvZGVidWcv
a2RiL2tkYl9tYWluLmMKPiArKysgYi9rZXJuZWwvZGVidWcva2RiL2tkYl9tYWluLmMKPiBAQCAt
NzI3LDE0ICs3MjcsMTAgQEAgc3RhdGljIGludCBrZGJfZGVmY21kKGludCBhcmdjLCBjb25zdCBj
aGFyICoqYXJndikKPiAgICAgICAgIG1wLT5oZWxwID0ga2RiX3N0cmR1cChhcmd2WzNdLCBHRlBf
S0RCKTsKPiAgICAgICAgIGlmICghbXAtPmhlbHApCj4gICAgICAgICAgICAgICAgIGdvdG8gZmFp
bF9oZWxwOwo+IC0gICAgICAgaWYgKG1wLT51c2FnZVswXSA9PSAnIicpIHsKPiAtICAgICAgICAg
ICAgICAgc3RyY3B5KG1wLT51c2FnZSwgYXJndlsyXSsxKTsKPiAtICAgICAgICAgICAgICAgbXAt
PnVzYWdlW3N0cmxlbihtcC0+dXNhZ2UpLTFdID0gJ1wwJzsKPiAtICAgICAgIH0KPiAtICAgICAg
IGlmIChtcC0+aGVscFswXSA9PSAnIicpIHsKPiAtICAgICAgICAgICAgICAgc3RyY3B5KG1wLT5o
ZWxwLCBhcmd2WzNdKzEpOwo+IC0gICAgICAgICAgICAgICBtcC0+aGVscFtzdHJsZW4obXAtPmhl
bHApLTFdID0gJ1wwJzsKPiAtICAgICAgIH0KPiArICAgICAgIGlmIChtcC0+dXNhZ2VbMF0gPT0g
JyInKQo+ICsgICAgICAgICAgICAgICBzdHJzY3B5KG1wLT51c2FnZSwgYXJndlsyXSArIDEsIHN0
cmxlbihhcmd2WzJdKSAtIDEpOwo+ICsgICAgICAgaWYgKG1wLT5oZWxwWzBdID09ICciJykKPiAr
ICAgICAgICAgICAgICAgc3Ryc2NweShtcC0+aGVscCwgYXJndlszXSArIDEsIHN0cmxlbihhcmd2
WzNdKSAtIDEpOwoKTGV0J3MgdGhpbmsgYWJvdXQgc29tZSB0ZXN0IGNhc2VzLi4uCgpPbGQgY29k
ZToKbXAtPnVzYWdlID0ga2RiX3N0cmR1cChhcmd2WzJdLCBHRlBfS0RCKTsKaWYgKG1wLT51c2Fn
ZVswXSA9PSAnIicpIHsKICBzdHJjcHkobXAtPnVzYWdlLCBhcmd2WzJdKzEpOwogIG1wLT51c2Fn
ZVtzdHJsZW4obXAtPnVzYWdlKS0xXSA9ICdcMCc7Cn0KCk5ldyBjb2RlOgptcC0+dXNhZ2UgPSBr
ZGJfc3RyZHVwKGFyZ3ZbMl0sIEdGUF9LREIpOwppZiAobXAtPnVzYWdlWzBdID09ICciJykKICBz
dHJzY3B5KG1wLT51c2FnZSwgYXJndlsyXSArIDEsIHN0cmxlbihhcmd2WzJdKSAtIDEpOwoKRXhh
bXBsZSBzdHJpbmc6IGFyZ3ZbMl0gPSAiXCJ4eXpcIiIKCk9sZDoKICBtcC0+dXNhZ2UgPSBzdHJk
dXAoIlwieHl6XCIiKQogIG1wLT51c2FnZSBiZWNvbWVzICJ4eXpcIiIKICBtcC0+dXNhZ2UgYmVj
b21lcyAieHl6IgoKTmV3OgogIG1wLT51c2FnZSA9IHN0cmR1cCgiXCJ4eXpcIiIpCiAgbXAtPnVz
YWdlIGJlY29tZXMgInh5elwiIgogIG1wLT51c2FnZSBkb2Vzbid0IGNoYW5nZSAoISkKClRvIG1h
dGNoIG9sZCBiZWhhdmlvciwgSSB0aGluayB5b3UnZCBuZWVkICJzdHJsZW4oYXJndlsyXSkgLSAy
IiwgcmlnaHQ/CgpJJ2xsIGFsc28gbm90ZSB0aGF0IHdpdGggYSBkaWZmZXJlbnQgKG1hbGZvcm1l
ZCkgZXhhbXBsZSBzdHJpbmcsIHRoZQpvbGQgY29kZSB3b3VsZCBoYXZlIGFsc28gYmVlbiBicm9r
ZW4uCgoKRXhhbXBsZSBzdHJpbmc6IGFyZ3ZbMl0gPSAiXCIiCgpPbGQ6CiAgbXAtPnVzYWdlID0g
c3RyZHVwKCJcIiIpCiAgbXAtPnVzYWdlIGJlY29tZXMgIiIKICBtcC0+dXNhZ2VbLTFdID0gJ1ww
JzsgIC8vIEJBRCEKCgpUaGF0IHNob3VsZCBwcm9iYWJseSBiZSBmaXhlZCB0b28uIEx1Y2tpbHkg
dGhpcyBjb21tYW5kIGNhbid0IGJlIHJ1bgpieSBhIHVzZXIgaW4ga2RiIGFuZCBpdCBqdXN0IHJ1
bnMgc3R1ZmYgYXQgaW5pdCB0aW1lLi4uCgpNYXliZSBhIHJpZ2h0IGZpeCBpcyBzb21ldGhpbmcg
bGlrZSB0aGlzICh1bnRlc3RlZCkuIFlvdSBjb3VsZCBldmVuCnB1dCBpdCBpbiBhIHNtYWxsIGhl
bHBlciBzbyBpdCBkb2Vzbid0IG5lZWQgdG8gYmUgZHVwbGljYXRlZCBmb3IgYm90aApoZWxwIGFu
ZCB1c2FnZToKCmxlbiA9IHN0cmxlbih0b19jb3B5KTsKaWYgKHRvX2NvcHlbMF0gPT0gJyInKSB7
CiAgdG9fY29weSsrOwogIGxlbi0tOwogIGlmICh0b19jb3B5W2xlbi0xXSA9PSAnIicpCiAgICBs
ZW4tLTsKfQpkZXN0ID0ga3N0cm5kdXAodG9fY29weSwgbGVuLCBHRlBfS0RCKTsKCi4uLm9mIGNv
dXJzZSwgdGhhdCBzdG9wcyB1c2luZyBrZGJfc3RyZHVwKCkuIEkgZG9uJ3QgcmVhbGx5IHNlZSB3
aHkKdGhhdCBleGlzdHM/IFRoZSBjb21tZW50cyBtYWtlIG5vIHNlbnNlLi4uCgoKCi1Eb3VnCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
