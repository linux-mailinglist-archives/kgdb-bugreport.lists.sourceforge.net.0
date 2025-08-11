Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4438B21410
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 Aug 2025 20:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9R9hC58+FjEt+bUoskIweDIsgdfoUH95rZT5VXgukmk=; b=M+XHbudAlMHZ2SexSbm7twalma
	PnE/5TW/n6YJkW1TfEqYrT0qyNzI9wGMNzp4k9g+/HbXZTYsBGsVBRw+7TSgsy8GVmdW82Gg9R1t8
	2JqZovJxYgwvnqtslYKQZ8DZR5nksOaFzbZt0NEwDxaF8KQYU4vcrPCA1OWWFji8Mf+U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ulX7m-0002Xm-Gh
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 11 Aug 2025 18:19:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ulX7k-0002Xe-MC
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Aug 2025 18:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wt9K5DEyPLjM+bq7x47Rs4ozsUCicWqFg4lpxq8FXHg=; b=KsLEkE3FR5ToLNRIV7HATm1Fwi
 X0D7lennXCjbpso+fLyECo0TubR/xPxpfjmfe5JCX+3XuFhI+efTVtNSVxLB9ZzRwl6UOiwjXnEKC
 kbKzH2EC22Kr7Kf7VCuXnLJIVQcXkgiVzCOPwXQSkFtYRhg04Qh51phErEGpzGpFHPv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wt9K5DEyPLjM+bq7x47Rs4ozsUCicWqFg4lpxq8FXHg=; b=BnIqY2yW4R4mfWFOOYZiWP+UbO
 5COycl85wHiHS+64lOE4YD+sc9k4yOMkhw6UTBqYU4ok8wX4kHrMjCBkN1fQiNrgulSgXjK3Qb36p
 janvSc6HiK6kyfZQf8klvR+tbFjoO0ivbJobFUodRzhh9gwzsc0DDspJIUsKBI7ydCLA=;
Received: from mail-qt1-f182.google.com ([209.85.160.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ulX7k-0006Ig-4g for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Aug 2025 18:19:56 +0000
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4b0848b5191so47156471cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Aug 2025 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754936390; x=1755541190;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wt9K5DEyPLjM+bq7x47Rs4ozsUCicWqFg4lpxq8FXHg=;
 b=C51lfrzOYNAPSEisEhlcNXQ+zqcf/0WvDAzbNQ3yYzL/jSkzeQQwD3+/zWY/bxgwEB
 1v189HRztRRQVNYLo1gK3GoH7VsV3mss9z47g2m/E757xCtxwTDZmQ96AggfKug7iI7T
 eU0fuDz0Fp8hiTrimebyRKLt+9mi9ans/TLho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754936390; x=1755541190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wt9K5DEyPLjM+bq7x47Rs4ozsUCicWqFg4lpxq8FXHg=;
 b=Q3VXcQihTyrwhm3lqyrCQtxpQ/bwCuQ5KRMfUVLCvjh/J6QQ9kd5jMsC3CFS0sfwuT
 zH4nC2YOQALz/5qurcjWb2edZMuKy4ilOZJuYGipNDZ2ljLX330wQIyGVIPlkHfBcsKs
 545MJF9wUCKIv2fgrL+L846GPb0qsKQQiiftvVhKP/Ep8j4q8vd+/836gnIACbsPmdqA
 P71LHjxNGxf4iO5IErz5B92UnzXux8g/T4ynwDs9uUHHFfv56Cr2h0YiOY30/TsbkCoO
 k+rvfqiyDYUh6sk5zvO9Wcd1EazEUhXNv7o/+xpjZ0XP+XiDsAu+U0UnofSpVq2yJh0I
 mNFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6QHZmFf2LTFuXL7qjlVpaiTJr6uLWgI8i2u6wemkSoTRyVyFOsja0ycTyym47I3ZdoX+dH04szSGNgKzdnQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzg8+Ar0+FsP87bqN6mDs0+Em0yk4vrmVcOCuqiwmqLNNRkMWCt
 NXZu6anYaQK12CxaxTLrdZVD+51CDtmvwdE+awrJ/Bv3H5GXHKcQQuq768TmO+v7xL3MXmaXJ6I
 JE3w=
X-Gm-Gg: ASbGncsefPYo6M7CXyA+bAMXO5Ued9dv0VgLOQteLmyKH/FOjRmqUYAAOdCSMJZTIv5
 ENbnupbPLeQukH1va2I8Mob0W6/4FjfgEUMo8LAYRudilTsKkSxZIsJohdBSVjWum78NJw+nAcC
 No4hGWPLpuMQWRQe/Pokc+J11ISaEZEc9GyiGIJvBNvVqctLeAg/GEem/bn1EszhiyqC5zxQXt3
 X7VKgffCwphwIKRycb11jbCqr/CFBwKBcEQh8rs/ZY2fhXzYtdIxvLp9dowlc6J3lvaLyYI/U7K
 n7FYDIy+wGVls3VC3ss9sxzjA4VcRWzuFeABQVpu4o0GGmE2+vIGzujP5iT0LsJmgyLApB5oQRF
 BCjj7lkdAYKKjrlvliDMCxmgk4N51Beqg45SzqchcxpmdjGEiw42W906ZVvF43D3Wug==
X-Google-Smtp-Source: AGHT+IEDiKkwuY3uPT/YFY3MmyKFILKVPLiiYzosbt9y9amFI0RKZqmXKYRzxn+2uVwfs8s4L6RKyw==
X-Received: by 2002:a17:903:2bce:b0:240:3c51:105e with SMTP id
 d9443c01a7336-242fc246637mr6318715ad.20.1754934541010; 
 Mon, 11 Aug 2025 10:49:01 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com.
 [209.85.215.182]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef67e8sm280474775ad.8.2025.08.11.10.48.59
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 10:48:59 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b4209a0d426so4639766a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Aug 2025 10:48:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjRa+cpTP8pVCuvvLlX6HUPWSD4UhzcfnmCxzDUcmK6CSs+1G2AeShwHpvcu+c6vjxXYrWJ3ChIb46YfzYFw==@lists.sourceforge.net
X-Received: by 2002:a17:902:ef0a:b0:235:f459:69c7 with SMTP id
 d9443c01a7336-242fc36c67dmr5818775ad.52.1754934538293; Mon, 11 Aug 2025
 10:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250811170351.68985-1-thorsten.blum@linux.dev>
In-Reply-To: <20250811170351.68985-1-thorsten.blum@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Aug 2025 10:48:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrEv+=KmjZTDt7F5ftuw5xrpOyEim0OrGAkoiJ5Wi2cg@mail.gmail.com>
X-Gm-Features: Ac12FXxPkL1S2f4PQPz2QV2wpNlFygKeHqK0V0jC13wbb3oVPpObsEueWXqhEY8
Message-ID: <CAD=FV=UrEv+=KmjZTDt7F5ftuw5xrpOyEim0OrGAkoiJ5Wi2cg@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Aug 11,
 2025 at 10:04 AM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > strcpy() is deprecated; use strscpy() instead. > > Use the return
 value of strscpy() instead of calling strlen() aga [...] 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulX7k-0006Ig-4g
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Replace deprecated strcpy() with
 strscpy() in vkdb_printf()
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, Daniel Thompson <danielt@kernel.org>,
 linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCAxMDowNOKAr0FNIFRob3JzdGVuIEJsdW0gPHRo
b3JzdGVuLmJsdW1AbGludXguZGV2PiB3cm90ZToKPgo+IHN0cmNweSgpIGlzIGRlcHJlY2F0ZWQ7
IHVzZSBzdHJzY3B5KCkgaW5zdGVhZC4KPgo+IFVzZSB0aGUgcmV0dXJuIHZhbHVlIG9mIHN0cnNj
cHkoKSBpbnN0ZWFkIG9mIGNhbGxpbmcgc3RybGVuKCkgYWdhaW4uCj4KPiBMaW5rOiBodHRwczov
L2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvODgKPiBTaWduZWQtb2ZmLWJ5OiBUaG9yc3Rl
biBCbHVtIDx0aG9yc3Rlbi5ibHVtQGxpbnV4LmRldj4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tk
Yi9rZGJfaW8uYyB8IDYgKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL2RlYnVnL2tkYi9rZGJfaW8u
YyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMKPiBpbmRleCA5YjExYjEwYjEyMGMuLjIwNjI0
OTRjNDEzYiAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCj4gKysrIGIv
a2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYwo+IEBAIC03MzIsOCArNzMyLDcgQEAgaW50IHZrZGJf
cHJpbnRmKGVudW0ga2RiX21zZ3NyYyBzcmMsIGNvbnN0IGNoYXIgKmZtdCwgdmFfbGlzdCBhcCkK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgKiBTaGlmdCB0aGUgYnVmZmVyIGxlZnQuCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgKmNwaG9s
ZCA9IHJlcGxhY2VkX2J5dGU7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RyY3B5KGtkYl9i
dWZmZXIsIGNwaG9sZCk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgbGVuID0gc3RybGVuKGtk
Yl9idWZmZXIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGxlbiA9IHN0cnNjcHkoa2RiX2J1
ZmZlciwgY3Bob2xkKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBuZXh0X2F2YWlsID0ga2Ri
X2J1ZmZlciArIGxlbjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX2F2YWlsID0gc2l6
ZW9mKGtkYl9idWZmZXIpIC0gbGVuOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8ga2Ri
X3ByaW50X291dDsKCkl0IG1hZGUgbWUgYSBsaXR0bGUgbmVydm91cyB0aGF0IHlvdSdyZSBub3Qg
Y2hlY2tpbmcgZm9yIHRoZSBmYWN0IHRoYXQKc3Ryc2NweSgpIGNvdWxkIHJldHVybiBhbiBlcnJv
ciBjb2RlLiBXaXRob3V0IHRoZSBjaGVjayB5b3UncmUganVzdApyZXBsYWNpbmcgb25lIHR5cGUg
b2YgcHJvYmxlbSAoYnVmZmVyIG92ZXJmbG93KSB3aXRoIGFub3RoZXIgdHlwZSAodGhlCmNvZGUg
cnVubmluZyB3aXRoIGEgbmVnYXRpdmUgbGVuZ3RoKS4gSU1PIGluIGNhc2VzIGxpa2UgdGhpcyBl
aXRoZXIKbGVhdmUgdGhlIHN0cmxlbigpIGluIHRoZXJlIG9yIGNoZWNrIHRoZSByZXR1cm4gdmFs
dWUgZm9yIGVycm9ycy4KCi4uLnNvIEkgbG9va2VkIGEgbGl0dGxlIGRlZXBlciBoZXJlIHRvIHNl
ZSBpZiB0aGUgYnVmZmVyIG92ZXJmbG93IHdhcwphY3R1YWxseSBwb3NzaWJsZSB0byBiZWdpbiB3
aXRoLiBMb29raW5nLCBJIF90aGlua18gdGhpcyBpcyB0cnVlOgoKKiBgY3BgIGlzIGEgcG9pbnRl
ciBpbnRvIGBrZGJfYnVmZmVyYCAobG9jYXRpb24gb2YgZmlyc3QgJ1xuJykKKiBgY3Bob2xkYCBh
bmQgYGNwYCBhcmUgZXF1YWwgYXQgdGhpcyBwb2ludC4KCi4uLnNvIHlvdSdyZSBndWFyYW50ZWVk
IG5vdCB0byBvdmVyZmxvdyBiZWNhdXNlIHRoZSBkZXN0aW5hdGlvbiBhbmQKc291cmNlIG92ZXJs
YXAuIC4uLmJ1dCB0aGF0IG1lYW5zIHdlIHNob3VsZG4ndCBoYXZlIGJlZW4gdXNpbmcKc3RyY3B5
KCkgZWl0aGVyIHdheS4gQm90aCBzdHJjcHkoKSBhbmQgc3Ryc2NweSgpIHNheSB0aGF0IHRoZWly
CmJlaGF2aW9ycyBhcmUgdW5kZWZpbmVkIGlmIHRoZSBzcmMvZGVzdCBvdmVybGFwLiBUaGlzIG1l
YW5zIHRoYXQKcmVhbGx5IHRoZSByaWdodCBmaXggaXMgdG8gdXNlIG1lbW1vdmUoKS4KClRoZSBh
Ym92ZSBpcyBiYXNlZCBzb2xlbHkgb24gY29kZSBpbnNwZWN0aW9uIHcvIG5vIHRlc3RpbmcuIElm
IEkgZ290Cml0IHdyb25nLCBsZXQgbWUga25vdy4KCgo+IEBAIC04NzIsOCArODcxLDcgQEAgaW50
IHZrZGJfcHJpbnRmKGVudW0ga2RiX21zZ3NyYyBzcmMsIGNvbnN0IGNoYXIgKmZtdCwgdmFfbGlz
dCBhcCkKPiAgICAgICAgICAqLwo+ICAgICAgICAgaWYgKGtkYl9ncmVwcGluZ19mbGFnICYmICFz
dXNwZW5kX2dyZXApIHsKPiAgICAgICAgICAgICAgICAgKmNwaG9sZCA9IHJlcGxhY2VkX2J5dGU7
Cj4gLSAgICAgICAgICAgICAgIHN0cmNweShrZGJfYnVmZmVyLCBjcGhvbGQpOwo+IC0gICAgICAg
ICAgICAgICBsZW4gPSBzdHJsZW4oa2RiX2J1ZmZlcik7Cj4gKyAgICAgICAgICAgICAgIGxlbiA9
IHN0cnNjcHkoa2RiX2J1ZmZlciwgY3Bob2xkKTsKPiAgICAgICAgICAgICAgICAgbmV4dF9hdmFp
bCA9IGtkYl9idWZmZXIgKyBsZW47Cj4gICAgICAgICAgICAgICAgIHNpemVfYXZhaWwgPSBzaXpl
b2Yoa2RiX2J1ZmZlcikgLSBsZW47CgpJIGJlbGlldmUgdGhlIGFib3ZlIGNhc2UgaXMgc2ltaWxh
ci4KCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9r
Z2RiLWJ1Z3JlcG9ydAo=
