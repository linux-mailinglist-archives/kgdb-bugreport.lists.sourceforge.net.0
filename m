Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A5BB7986
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 03 Oct 2025 18:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwsfOI3iTq35NDWpry7AoLHp947bxuP0QgMbEHsmDSc=; b=U2BWmglmhHo3b7R+V68ziZzwT8
	nbqoQdg0KnDvo/RSz+rKcT4Bak4DvAnFYH8RIjA7Ncp0nkIjCjzV6vsBflMOuzNQ0vuhNoJFugP3g
	uRI/c95UpXbWfUeAe09FNHKrzXczZ1ryrRZswFOFclev9Y/TyQ+St6nOEvViiUq0ypcI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1v4iuL-000486-ED
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 03 Oct 2025 16:45:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1v4iuK-00047z-9q
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 03 Oct 2025 16:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NJMtllFi1zVk+JAOiwqLtgaBseyeNZFxDAwdyexpj7I=; b=UyNAO+zznAw9mUpELgfRHHBnEj
 BThrwXs3mvRR3C7h55TPRCw6nKoEpfAAZTQuk+55g02mQ9lnOVJdWKl8JvWENjnFj03aBQG+n7XGQ
 Iue5zZLKup10LdQCk6HwRGRC9d+UonLj2T7RgU71vmGzZXaa4kDyrD4QhBdCnIdyI+/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NJMtllFi1zVk+JAOiwqLtgaBseyeNZFxDAwdyexpj7I=; b=iwBIDt3OaRrv7FOqRJnV6clKcO
 A0QUEOswaxXiJaVg6BJInLJOp4yPVNnzBkkgn/MtAQTS06c7BQ8jzuKNmrp45fuClT35BSdpPXOG8
 px1hl6RH6O/Ed+gzzYgsPf/3hFdMcwVj8XGT07GQZR012yZSwVo5Xd16wYRgGXuopldo=;
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v4iuJ-0001MT-Qf for kgdb-bugreport@lists.sourceforge.net;
 Fri, 03 Oct 2025 16:45:24 +0000
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-428551be643so19151885ab.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 03 Oct 2025 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759509912; x=1760114712;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJMtllFi1zVk+JAOiwqLtgaBseyeNZFxDAwdyexpj7I=;
 b=ff3yzYwN0DcM3/TXUwToq08xoPEvzVhMWD9TkfgaAa2dO+k9PIKsYWGV6rZ+mPNAKn
 8TMAbMjYtdm2A6EjeJf2K1rGQv9fTyYQOZCE+reX2Yz3pcJcxSZUG0lx5vppkaG2pmiu
 dbPFF0v9Rk+TMIiZZ13XfcVUgHYLdIXmCR2is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759509912; x=1760114712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJMtllFi1zVk+JAOiwqLtgaBseyeNZFxDAwdyexpj7I=;
 b=CzOw6lU7oRESL0hnFuN8o0ZbqVl4T399eCm98hM2HnkvVIl2DtJnA0evdiTnJeoW3Z
 POTQugDhd1OWMmMxjo1ZCPtvC1RJfyrnCgUIfhAmGWxm+ooqmB/lRi4iU7mKMAQqg8V+
 9pJ/4Gm/oXhHDRREJ9ZoMqS1D7wBfGG9UMXMoiVbPO0i0IXZOHZnsNGW0+qXMjStwlEU
 iiVgyMsAZxKbXuuNG25WffjE7hbeAIQjn6OORquO9bP7dQJRwiwoagiUhA53wyvVfBt7
 IlXEHdrF8pWH6UP3z1+lOqbfR1G+ferdncr6PlQI/XRR64tT4OiuGbMgIazqunmE4tsM
 k42w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVSHbOaruujD8idb9JHD6B/FN9luvWzVRzRqdYWF6PzglYbfQ2nRzBGe6u8WCiJchlLcgZVG1Wr6seBC9FSA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx7evq7F3ekg67rspg7PmPdh4WnoRzewWTLnPWdJfYckJeNJ0IC
 mynRww0K9akWjcUIL6Qm6Nk+J80De1LT6krZDbn7pCgJFAQDzPSw2xKr6+Y2QFZVf1aMIXQ08jy
 WGfg=
X-Gm-Gg: ASbGnctBZ2YPtjGSzQwqcXH7r3KWK/qkQeK6rj6gFpgMgrAEqTmzRGezd9+lA0LnEhs
 XH7B1KnHxsfIamuofCE8IUhFG/D20nu2NXMyRdckDMR4ZUhINqmXO3lFjEEuxQI4dcMfnwfj0fq
 7vgwtByTunbJQ4l0fwd9iOyx6YQPBMvaGqZPlN9YkK6XlUSlYdkaUNHLSTti4FDH8hTCIjFTR/W
 2bLde751vGArTtkuSnDCpbW3xJm9GOeRdlFAFqj805Wc4K3e3P/i5WlkfwyIs2a5G2cWlmLYeL9
 7MK78SH/H9spvNTawD3gZw26PwR5FDPqgktP0Or8QU1LHT9IwMZVdT7qvx1SswmWvg++rRSTc+G
 zwAaApQglP4PhhXZhzhgbzaTjo8mDknSMZNkmyL8Vv1Q/Eprlb23mJm/I47yeC2Jr6qcTWe2i06
 RL8TSFYMzrMhajOXPtXIMy4Q0F
X-Google-Smtp-Source: AGHT+IG7PM3xhEq0VbkAbwGcHRMT+bJF+yLkJNIF07Q5WonKYpa+80S98YukYJcbrveM5TYkSHsWBQ==
X-Received: by 2002:a05:6a20:3953:b0:2ec:58d3:1d5c with SMTP id
 adf61e73a8af0-32b6208e8c5mr5028616637.33.1759509586927; 
 Fri, 03 Oct 2025 09:39:46 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b01f9ced7sm5302963b3a.15.2025.10.03.09.39.45
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 09:39:46 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b60971c17acso2199549a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 03 Oct 2025 09:39:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLaiWlb6svRTf4eQuAFq6oqyFD6QOIpYodJKcnW7jeZuYu0PEYbYOsR64gc39ppCl8joce7s00t/Wcsozpwg==@lists.sourceforge.net
X-Received: by 2002:a17:902:f64f:b0:274:aab9:4ed4 with SMTP id
 d9443c01a7336-28e9a693ae9mr39060205ad.57.1759509585162; Fri, 03 Oct 2025
 09:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251003151220.1580-1-matvey.kovalev@ispras.ru>
In-Reply-To: <20251003151220.1580-1-matvey.kovalev@ispras.ru>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Oct 2025 09:39:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4hRA8WnvxYNgXsULrzOTCdXZ9JMHgZ=XxqpVZz5DNOQ@mail.gmail.com>
X-Gm-Features: AS18NWAd1qH6YrlVAYnGRB92B_bLv9XoV7lowG4JApAcaOoF75jMCDzEP5Jztnc
Message-ID: <CAD=FV=V4hRA8WnvxYNgXsULrzOTCdXZ9JMHgZ=XxqpVZz5DNOQ@mail.gmail.com>
To: Matvey Kovalev <matvey.kovalev@ispras.ru>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Oct 3,
 2025 at 8:13 AM Matvey Kovalev <matvey.kovalev@ispras.ru>
 wrote: > > Bits of scancode are dropped except 7 low-order ones. > So, scancode
 can't be equal 0xe0. > > Found by Linux Verific [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.176 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4iuJ-0001MT-Qf
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: delete unexecuted if-block in
 kdb_get_kbd_char()
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
Cc: lvc-project@linuxtesting.org, kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <danielt@kernel.org>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIE9jdCAzLCAyMDI1IGF0IDg6MTPigK9BTSBNYXR2ZXkgS292YWxldiA8bWF0
dmV5LmtvdmFsZXZAaXNwcmFzLnJ1PiB3cm90ZToKPgo+IEJpdHMgb2Ygc2NhbmNvZGUgYXJlIGRy
b3BwZWQgZXhjZXB0IDcgbG93LW9yZGVyIG9uZXMuCj4gU28sIHNjYW5jb2RlIGNhbid0IGJlIGVx
dWFsIDB4ZTAuCj4KPiBGb3VuZCBieSBMaW51eCBWZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRl
c3Rpbmcub3JnKSB3aXRoIFNWQUNFLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dmV5IEtvdmFsZXYg
PG1hdHZleS5rb3ZhbGV2QGlzcHJhcy5ydT4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJf
a2V5Ym9hcmQuYyB8IDMgLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2tleWJvYXJkLmMgYi9rZXJuZWwvZGVi
dWcva2RiL2tkYl9rZXlib2FyZC5jCj4gaW5kZXggM2E3NDYwNGZkYjhhNy4uMzg2ZDMwZTUzMGI3
OCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvZGVidWcva2RiL2tkYl9rZXlib2FyZC5jCj4gKysrIGIv
a2VybmVsL2RlYnVnL2tkYi9rZGJfa2V5Ym9hcmQuYwo+IEBAIC0xNDUsOSArMTQ1LDYgQEAgaW50
IGtkYl9nZXRfa2JkX2NoYXIodm9pZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIENUUkwoJ0Yn
KTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgaWYgKHNjYW5jb2RlID09IDB4ZTApCj4gLSAgICAg
ICAgICAgICAgIHJldHVybiAtMTsKPiAtCgpUaGUgc2FtZSBwYXRjaCBoYXMgYWxyZWFkeSBiZWVu
IHNlbnQgYW5kIHdhcyBsYW5kZWQ6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA1
MDcxMDQzMzcuMjAxNjk1LTEtY29saW4uaS5raW5nQGdtYWlsLmNvbS8KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5n
IGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
