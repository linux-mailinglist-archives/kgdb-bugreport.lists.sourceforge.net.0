Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91345B0AC47
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 19 Jul 2025 00:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hpz7oLunAHXsp7by/Esdgq7mwj4gVCRVjO2zraN/9II=; b=ZuTP96scYO8L+/XqgsbjX+4USa
	e/3njhsBBW3egBOZT+NseMbxDcvxwJi2G0KHSb946ZPoJB6oq+PY3eBLnP5fELd2MDz7BjmzZzmOP
	O2efzk29rS4nxNDT/gryJZtqQ6taKmdcSYTye7Pw3rdFzY8+HyJYCSU3wjAhqfBCw2c4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uctt6-0006iW-Co
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 18 Jul 2025 22:49:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uctt4-0006iN-D3
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 18 Jul 2025 22:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hELc5E/W58AEsTFPxRlrtTifL6X7XT08Dw5sqYCmPJM=; b=PdkizYG04MIHTsqzmAE2bVnftB
 Jl3D+eCXWMsn2sHBrG7FBaZB/ZAInCy8wfdNX5F++Ot0DW4PBTUYOS0/radIZPZTZqs+SNiRCzJ3l
 UzmBmaELdSyFRhGe/s+RQipNL11vE0C09I3XyAPUiJERcwbQgawMVUCptlNhjyeZNg5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hELc5E/W58AEsTFPxRlrtTifL6X7XT08Dw5sqYCmPJM=; b=UejDFEIkT0lxmsSRqVd0rEO7JK
 /XEx9KmR23qlVcjx45JHlncPb0SPmyjREDuwowHzqEoPTM1M+YV48TPMaCZntpshwoQU5EJ2gK+Lr
 mt5NjEF+GfN75KuawstbfiHXBBLm1kHgnpFa9D+FJZ9aUG9nGNmSBRF/yxcj76O/cBpY=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uctt3-0000sZ-To for kgdb-bugreport@lists.sourceforge.net;
 Fri, 18 Jul 2025 22:49:06 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso3333223b3a.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 18 Jul 2025 15:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752878933; x=1753483733;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hELc5E/W58AEsTFPxRlrtTifL6X7XT08Dw5sqYCmPJM=;
 b=Ydh+P7UR0DFaMjzpm0sm4E0zTfhkO9bLGv0u21T9jnHQaF6m5rHQFPlKW1HaNTNGtZ
 saDfH/Gj0rN9ZvMs4jTZGBm0v4CDBPN5xCc9ol4nGTfGeP+aIq77nygcQy2g8WTe5K57
 M0N9h8TbZg2DuPPT9hV86LeQWRxiqphi75cJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752878933; x=1753483733;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hELc5E/W58AEsTFPxRlrtTifL6X7XT08Dw5sqYCmPJM=;
 b=DO8baE8OkVN0b0inAbOTHeqF78V1Y+Unt4aSIPsPA1smMUOcdclZZ8NzVHyQVlIFfu
 k5bV9OqO+k9L0s+QjGQkyI+0XptmrntNk0NPHCaRc1RB4SEr8vRuQxPrGXu+w3N+PSsE
 mZ9aYgvMSz+Sa0A84VJJSIUHQhoit9NcgjrXSxlv4A3lBUD+zIS4jktoaeULzPvEQMN4
 E5LbGYsJAZ6Ml6UODS4PHxcGmeirMj1gWUaDxs9rwqjfmIkFlGzbeHG9BjHShsVIs4Ri
 OBPskM7u/IuHMpH337fBu2a6N9rMnp7wGkRjYNhdqP+o7n4PnSaq1/w+1saljpzZpkOz
 cQIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhz+P10MnoyQQVq25Mpec4ruXYjXEmG9YjUhVU8j/B9i85Q54k3lrMEcZTr8I3Y9I5hZcUsebxhd4KZLEqRQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxS60DclktLU3EAVsuOZwTs6PhHt+HDXVwiJLO9+WJSm3z4XIpM
 19/lFOWMu59w/kfzLFc3he2b0/CWcDVqOybRyLqTg4/J2gMcvkR5xRDJ0LRCsl74gDQPC7J8P5S
 Z7Ec=
X-Gm-Gg: ASbGnctEsLdMrvdiYpuLQQ40ik4lLm69ri2Ndhwu0ntzGJAOMV4ZUbapUXaAqgkUxUe
 wJbdwW/EVFMW0k838Z3Zr+w4uSkCsMyo0zxixrXw+Mpx8BVbPZmHnN37eScHSVGwR+E3ig/l/hM
 9F3YYiO/10nEJIedYcoEGfW1X6HepweVlnByDkHeESSLXt+FJvdJc5DBK077wALw48zguMmd7eL
 i49WHK1ooCk04hdw3cvow+c/DGw3J5Ou54Ro4ExV018wFNE1e0r9Lz6R1b4ym5mzLtSo2Qgm6Wd
 RndP6IuefxdMtaXxSwYQo7BNIci3qtzzQYEw6uOddBqRmogNXjVzQ63rBlE2LaseKHiTdJwUy1R
 6WBcZ+Zb7Ha9aM63pCEqdEgrdRsDFtqZCb51oGyXuTZB2SoRzH4jKIH0f0VGCGQ==
X-Google-Smtp-Source: AGHT+IEOXYu990mtS1Z4qs35zRGLoJXyta1DUe38L8XIE8jawlaOlZIzwU9kDzGtrLgeZw3e3DXCXw==
X-Received: by 2002:a05:6a20:9188:b0:232:fcfc:7209 with SMTP id
 adf61e73a8af0-23812f448e7mr20910289637.35.1752878933484; 
 Fri, 18 Jul 2025 15:48:53 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com.
 [209.85.216.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d6bf2sm1713294b3a.53.2025.07.18.15.48.52
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 15:48:52 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3135f3511bcso2214696a91.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 18 Jul 2025 15:48:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVG5PA6Y1bJdvqpuP/p7+Y08bonc0Yvc/LDvDGVSOE9Z62UK/OY3S7w91tyqBsdb3r3uJFKL0Z5VO1/+mmGoA==@lists.sourceforge.net
X-Received: by 2002:a17:90b:3852:b0:311:f99e:7f4b with SMTP id
 98e67ed59e1d1-31c9f47ce80mr17566314a91.28.1752878931628; Fri, 18 Jul 2025
 15:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250718193220.316685-2-thorsten.blum@linux.dev>
In-Reply-To: <20250718193220.316685-2-thorsten.blum@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 15:48:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjmcOO0hdy2n9aL4Ms2beMVbBHW6Pk60Q-KvMCudYChA@mail.gmail.com>
X-Gm-Features: Ac12FXwxU5mzcJB8ppCxVaB7BneXFy3b3EU4qPIxu2y22lPFk0Y9cevEpEvupEk
Message-ID: <CAD=FV=UjmcOO0hdy2n9aL4Ms2beMVbBHW6Pk60Q-KvMCudYChA@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Jul 18,
 2025 at 12:32 PM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > strcpy() is deprecated;
 use strscpy() instead. > > Link: https://github.com/KSPP/linux/issues/88
 > Signed-off-by: Th [...] 
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
 [209.85.210.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uctt3-0000sZ-To
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: Replace deprecated
 strcpy() with strscpy()
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
Cc: kgdb-bugreport@lists.sourceforge.net, Daniel Thompson <danielt@kernel.org>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEp1bCAxOCwgMjAyNSBhdCAxMjozMuKAr1BNIFRob3JzdGVuIEJsdW0gPHRo
b3JzdGVuLmJsdW1AbGludXguZGV2PiB3cm90ZToKPgo+IHN0cmNweSgpIGlzIGRlcHJlY2F0ZWQ7
IHVzZSBzdHJzY3B5KCkgaW5zdGVhZC4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQ
L2xpbnV4L2lzc3Vlcy84OAo+IFNpZ25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPHRob3JzdGVu
LmJsdW1AbGludXguZGV2Pgo+IC0tLQo+ICBrZXJuZWwvZGVidWcvZ2Ric3R1Yi5jIHwgMjkgKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQoKbml0OiBTaW5jZSB0aGlzIG9ubHkgY292ZXJzIHRoaW5n
cyBpbiB0aGUgZmlsZSBgZ2Ric3R1Yi5jYCBhbmQgbm90CmV2ZXJ5dGhpbmcgaW4ga2VybmVsL2Rl
YnVnLCBwZXJoYXBzIHRoYXQgc2hvdWxkIGJlIGluIHRoZSBzdWJqZWN0CmxpbmU/IE1heWJlICJr
ZXJuZWw6IGRlYnVnOiBnZGJzdHViOiBSZXBsYWNlIGRlcHJlY2F0ZWQgc3RyY3B5KCkgd2l0aApz
dHJzY3B5KCkiPwoKT3RoZXIgdGhhbiB0aGF0LCB0aGlzIGxvb2tzIGZpbmUgdG8gbWUuCgpSZXZp
ZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0
IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
