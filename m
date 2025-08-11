Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFEB213EA
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 Aug 2025 20:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwEqeDZCnEWmxdnIr+JrL2HuRjfmEFGUG/6PwCyJMoc=; b=bwHL4wkmB7jQVJv/QcT5UdtREi
	h2aS4YzavW3BvmOpThIIh75a24UTxmYonysjzHXlxuO28hNGJ3ZQ6GB5qXoxWO2jZflG3CDc78b/L
	MjZObGlHtWyY+//XakF1fsIl3kiZ7EHrL7LRSUjEjm5x4bwuO9VBnRKfXbfWu+LWdVaw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ulX1t-0005uo-VD
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 11 Aug 2025 18:13:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ulX1s-0005ui-3j
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Aug 2025 18:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ANm4Uux2/v/BkH0mMC8Vcvx5lJDO9zkQ5mDxi+2+IZ0=; b=CLJpUfn6wUOnD1t57d/GYPSMV4
 UZLr2zfhPumZpHJ+nns8lF6eFVSaCN2CGJ03t7yrypa+EsUjZwdcy3fv97n003j1kbBJgQCUVlS6O
 H7dnrFNwpDEjoTz2WH+AAL/+ZkDo2EUbi6XqXR0tVqCDi1cMWApEMKD9LpNY3vtPghis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ANm4Uux2/v/BkH0mMC8Vcvx5lJDO9zkQ5mDxi+2+IZ0=; b=GhbASLfzoNrE5eVqV4HZ8s/zCH
 f+IpZJroCiossajhEI5vnD8ZFbrFW0oJGLeI6pVJlsEp7u48MHb1FiuHJ5Rw9MRAZ6wOg1/AVbhsZ
 tJ6JNKw9VkXjmhJoB89XoucOuJkeZqsDLS6JWy2GZyZ6BVqvFFH1fwwmf8tuj8HeE9uQ=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ulX1r-0005Kc-FO for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Aug 2025 18:13:52 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76a3818eb9bso4263623b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Aug 2025 11:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754936025; x=1755540825;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANm4Uux2/v/BkH0mMC8Vcvx5lJDO9zkQ5mDxi+2+IZ0=;
 b=G68iK7mkd9mzyaU9h6vYnupi7SUTzhy9TktXbwr8bc1JmAd941nt7r2+s8K6oGhoVq
 yFK23Xmw2CY5/RxAoaTtr8/xRPoIzGWc8AS05l24byJwmmSB//ow0sQ6K0cc3ER3ORTP
 coSRZAlAgwIdVZ0Hr12b1lSoh7QIu2wlZeSkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754936025; x=1755540825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANm4Uux2/v/BkH0mMC8Vcvx5lJDO9zkQ5mDxi+2+IZ0=;
 b=B9WfZNbRkY8B7IYzX7+Yt37sxLNLbQXxxMcUYD3W92r1YZqVtv/SpIX+kWhW4dQFEk
 a9u//qnzmgyxlRT8ThxaVU7pkltx6IUYfaXB33wdDK+rm2A3zlwZvi6f6SOn3/iT+YgG
 4/jsMlFGSUGHeVtCYswoHFXr85xikLcD5xZdlLDqhxDj5nSefEQ39GCTQbhiCl73KYdk
 TzfRcR5rNiaBLThrDSKQWeentlk3LMtK5pH8EM2YsC85pZhPczXiHWAxFDe9hfrI2mh0
 WH2dQX3OjHfKUbsCuuPQXOSYdmpQykiD8x/rvyh2k0cW96638kbyAdnQN5ZWxuERAgMY
 PHXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuK8/vFDL5XrlfjUFJ9pTigEpRNRCutKQcFkWqG/F97B7IdECzHZx5SzoAStAxfRlB5SsDILYf/U2RcvvlLg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw8oB/mOB2962q1jXhjsxKQv1qRqV+wFnoxTU5aC8P+wZwbP81N
 jDbD2uzlIQ7tZM1lPzu4xmCQA3F3JT3EUlFz3ApfjrmsjA4hZAlOK9nm2kdvFqtyvQRUQRej6/U
 IyZw=
X-Gm-Gg: ASbGncvHKXfF1dwG++Yt7vlyYLr4vxYLTFjohvdGjZUlJlMcbGFkZmPwxKFGiGMaZ+d
 Z7FknhXKHqi5RkPyqeAZz1MxLw3D71CyqfXGxuUFO8fn7Tq+teQUr88rb7sPp8n3aS4A75GSfcI
 TqjG/X7eFfO+S39XK6Ze/a2sW8m4UsHelY115trNJfysPch7cldwnz/3uvwfWtq3+hquxG43Ma8
 4QWei8bolT/2ocyq9JGXSMBFpsm0uCy+5srgTRLURKAd9pxiVtQSlK6LRS5mjcn+5zCRCteVXgM
 LTPVF8AteeIo5lY9K3mWceeVye77Q6/yWRAwnMB2bg1Uv76r2VWnBzZxCFD+lAUo5zMUV7I4PAp
 Sd0N07HW7kbFRz4QPC6fPLJIPl2A3hoJ+IJG7AK8ZCGW3yVQbJdWRU9LcoybpeFfnLQ==
X-Google-Smtp-Source: AGHT+IEnsNuTUTGU7shxc1Qt4S1ITYOoDbConO4thXZXyYqW9DGijRzggmskOpLNELVGpnnvDnkUhA==
X-Received: by 2002:a05:6a20:3d07:b0:240:17d2:c004 with SMTP id
 adf61e73a8af0-24055201a1amr22837735637.43.1754936024955; 
 Mon, 11 Aug 2025 11:13:44 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com.
 [209.85.214.175]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfcfe18sm27520623b3a.93.2025.08.11.11.13.43
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 11:13:43 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-23fe9a5e5e8so31666085ad.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Aug 2025 11:13:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWrVKHOSyUfGhEkDUdzaXogbtZi3puNKa3AGZ6UTRdCiqTxYCpid2hXirh627Xkfb4jwpZnIQQlavfIlfEyBQ==@lists.sourceforge.net
X-Received: by 2002:a17:903:19cc:b0:242:a3fc:5900 with SMTP id
 d9443c01a7336-242c1ffce82mr181750335ad.8.1754936022978; Mon, 11 Aug 2025
 11:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250811170351.68985-1-thorsten.blum@linux.dev>
 <CAD=FV=UrEv+=KmjZTDt7F5ftuw5xrpOyEim0OrGAkoiJ5Wi2cg@mail.gmail.com>
 <17A3048D-E2E3-41FD-A6A0-853B2E481B12@linux.dev>
In-Reply-To: <17A3048D-E2E3-41FD-A6A0-853B2E481B12@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Aug 2025 11:13:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzSD+pz9RNZDS0paDUWKJ-AW91U5DuEQziszYchuZGAQ@mail.gmail.com>
X-Gm-Features: Ac12FXyQvkSM0ZmqfknQHYkXyeurhKpeTOYtq8R_cD4QpIIkIrGjU0oRnuKfLKs
Message-ID: <CAD=FV=XzSD+pz9RNZDS0paDUWKJ-AW91U5DuEQziszYchuZGAQ@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Aug 11,
 2025 at 11:11 AM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > > ...so I looked a little deeper here to see if the buffer overflow
 was > > actually possible to begin with. Looking [...] 
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
 [209.85.210.172 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulX1r-0005Kc-FO
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

SGksCgpPbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCAxMToxMeKAr0FNIFRob3JzdGVuIEJsdW0gPHRo
b3JzdGVuLmJsdW1AbGludXguZGV2PiB3cm90ZToKPgo+ID4gLi4uc28gSSBsb29rZWQgYSBsaXR0
bGUgZGVlcGVyIGhlcmUgdG8gc2VlIGlmIHRoZSBidWZmZXIgb3ZlcmZsb3cgd2FzCj4gPiBhY3R1
YWxseSBwb3NzaWJsZSB0byBiZWdpbiB3aXRoLiBMb29raW5nLCBJIF90aGlua18gdGhpcyBpcyB0
cnVlOgo+ID4KPiA+ICogYGNwYCBpcyBhIHBvaW50ZXIgaW50byBga2RiX2J1ZmZlcmAgKGxvY2F0
aW9uIG9mIGZpcnN0ICdcbicpCj4gPiAqIGBjcGhvbGRgIGFuZCBgY3BgIGFyZSBlcXVhbCBhdCB0
aGlzIHBvaW50Lgo+ID4KPiA+IC4uLnNvIHlvdSdyZSBndWFyYW50ZWVkIG5vdCB0byBvdmVyZmxv
dyBiZWNhdXNlIHRoZSBkZXN0aW5hdGlvbiBhbmQKPiA+IHNvdXJjZSBvdmVybGFwLiAuLi5idXQg
dGhhdCBtZWFucyB3ZSBzaG91bGRuJ3QgaGF2ZSBiZWVuIHVzaW5nCj4gPiBzdHJjcHkoKSBlaXRo
ZXIgd2F5LiBCb3RoIHN0cmNweSgpIGFuZCBzdHJzY3B5KCkgc2F5IHRoYXQgdGhlaXIKPiA+IGJl
aGF2aW9ycyBhcmUgdW5kZWZpbmVkIGlmIHRoZSBzcmMvZGVzdCBvdmVybGFwLiBUaGlzIG1lYW5z
IHRoYXQKPiA+IHJlYWxseSB0aGUgcmlnaHQgZml4IGlzIHRvIHVzZSBtZW1tb3ZlKCkuCj4KPiBH
b29kIGNhdGNoLiBJIHJlYWQgYWJvdXQgdGhlIHVuZGVmaW5lZCBiZWhhdmlvciBpbiB0aGUgZnVu
Y3Rpb24gY29tbWVudCwKPiBidXQgbmV2ZXIgZW5jb3VudGVyZWQgaXQgYW5kIGhhdmVuJ3QgcmVh
bGx5IGJlZW4gbG9va2luZyBvdXQgZm9yIGl0Lgo+Cj4gPiBUaGUgYWJvdmUgaXMgYmFzZWQgc29s
ZWx5IG9uIGNvZGUgaW5zcGVjdGlvbiB3LyBubyB0ZXN0aW5nLiBJZiBJIGdvdAo+ID4gaXQgd3Jv
bmcsIGxldCBtZSBrbm93Lgo+Cj4gWWVzLCBJIGp1c3QgY29tcGlsZS10ZXN0ZWQgaXQgYXMgSSBk
aWRuJ3QgZXhwZWN0IHNyYy9kc3QgdG8gb3ZlcmxhcC4gQW5kCj4gdGhlbiBteSBsYXN0LW1pbnV0
ZSBjaGFuZ2UgdG8gc3RybGVuKCkgbWFkZSBpdCBldmVuIHdvcnNlLiBTb3JyeSBhYm91dAo+IHRo
YXQuCj4KPiBBcmUgeW91IGdvaW5nIHRvIGZpeCBpdCB1c2luZyBtZW1tb3ZlKCkgb3Igc2hvdWxk
IEkgc3VibWl0IGEgdjI/CgpEbyB5b3Ugd2FudCB0byBzZW5kIGEgdjIgdGhhdCBzd2l0Y2hlcyBp
dCB0byBtZW1tb3ZlKCk/CgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9y
dEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
