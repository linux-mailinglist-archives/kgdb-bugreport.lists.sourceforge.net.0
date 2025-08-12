Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44570B22D60
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Aug 2025 18:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zQLVPmwiXB5DEEHJo+6n4NMm02MjNNlamqsjI4Zj2A=; b=HYTMBtJZVaW9y2ytixkZGFaUAs
	UeuL8tHTk3X5LoVqjsU0RmNGOL1lAT0Js2fma8+kDkK12azzAhGhhBGo9Zz8yKfPO4q0sHTb4+wZ0
	1kSw/qbwbC9RNQufLdt3nk+pDd7+oniYqiwlk7e573JUl7itIKjkr7JoBN3d8vnaDItk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ulroQ-00032K-Rz
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 12 Aug 2025 16:25:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ulroP-000329-SE
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Aug 2025 16:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SLUEz/tgU3wZxbS9LDJCvqmXWzBlyYVJd+3ig6UYiHs=; b=aXd0kIxC7D+1PJFe/6iIBzV2mN
 UgJ/YTa9uK0UWTjTrflkzH2X+FpkmgoHSvIUozCaqCNJmSsRoHtOo4WnWlc2XenzvEsbhej3uBvaM
 1aXO+1uU/uCGJYAR0kTjlKrAa22Uy6NlGbdbKD1Krjze7CMxc0pSAz9Hlop65d7PScNs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SLUEz/tgU3wZxbS9LDJCvqmXWzBlyYVJd+3ig6UYiHs=; b=QmC2uUDZi5kHAfjmwUcQrpzzVQ
 3yEkg06mdAoClv9ihX3Vri9efT/8M1/SW5fU314I9GjbFfBMExoqe3B0HSUCGaxKkABeM9pHusEjD
 c2HafkwvLkMVnaDseiRERcnuV4ClOYhFZdhPVUKSFviKXGTwXslIoboCwzIhhupf36XE=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ulroQ-0005wr-45 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 12 Aug 2025 16:25:22 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-76bde897110so4742604b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 Aug 2025 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755015909; x=1755620709;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLUEz/tgU3wZxbS9LDJCvqmXWzBlyYVJd+3ig6UYiHs=;
 b=eQfTctvvONUhx8YBrDM5pLTX+6SZ9SJ0hJUytWMoV51SpOOu7yUD/GVv7Ih1bqKv66
 8orNBJ5xNlbRh0L0+VahQKYtyCnRqbYliOMydpHnHSBQrVFYEKHSbfjo+TX69uwIVEnk
 7h9kg+iaUvyEk+cMMdK97/quWB65vnLixuO8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755015909; x=1755620709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLUEz/tgU3wZxbS9LDJCvqmXWzBlyYVJd+3ig6UYiHs=;
 b=vJabZEWXjQAFGBkHyXnQg1M3yh2Rgn5CiuXApeuwV0MO4xahGFeHv69QtNVcPzPaqq
 pB78FeuuXyuSgC2b0Q/aCiYk3ErGj7oDYgvwEnw2Ibp08bXp34Uo5uJEKPS0OWTW2eQF
 x6mZcyScEXj3JdLc/4QqtwvM7lSlFX/JCvzbtMwJ0f5B78gE1D1fEs2iBF/pKc8sy2Oe
 hIuAz1c+pPLjSOclW/dvOwjfwgdKnSZrF9OYHKy07yOfpC2OUefTvIAKfnY4u5j7tgra
 f4MYdJtmWPlulsHI6jLaKTnWD0Grx3q8kGxzlObjGF8C04tM2fnTDMbvqZ9UC/m8E+L0
 H2oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpZYhVK+kBV31ULgK5+UxUj5A/3/rL7/t7/he/dKJ9A8/lm6787hSHiCwtKbWWa62pllR0+s9YI1/B3aOApg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwlyklXyBKTnusnZWNJ8sKEYWrFiTEhGasoBsCoJ79hq1iaspHu
 AGHErGk3HyBLMHl5c1a6dx2+qe1LimegcN0Tmphldt7fKg+xar579GW0MRUQUhQI9y8EgmaoU43
 Seq4=
X-Gm-Gg: ASbGncv2MeQp7RLBxsQ1qewueVapNc6C3q5svHWxHdOnVTmIG2VryVHDnAJXq4qsu3R
 MVCX0fyyHB8rRBOpbhA2TI8o6dMzusc/YvgLXBCubxzjUk7dO/lfMsKaRYnbOIBC1rjldE44w4E
 NpeF20LCcqzcLHT50RBxhoTirccRlwVVTUlXT910nl7IaE6xjbulJqo+RzwLi0DPbxZEQvLQjtZ
 mdXnHZiH3zFD/gYnuAC7yqFAw8mss02zBoKfggqY1fofTZckGNpcx8cVVlNvbFrYtF5hl/foMLS
 iuFHCTQbfbXXElKDo/8K3rZQUtFPXwnXFi+wxccrm477o94wwx4MYKm4uOmL0OMGx4EB85HzY/h
 a7xdtpw7+5bkywKXDBFm6ZWjfY+jeis/I6/gZGEgqsfCrxXiV1LnwGFdaqsiJzjBYe4Z1aseEO9
 ty
X-Google-Smtp-Source: AGHT+IHXGGMRLwCe33SZ3iGwJrxG1QVWIWeztXMPbwcGlWKE4qvZecMvT3nDfCT+NwdyZtbTIUNCew==
X-Received: by 2002:a05:6a20:1584:b0:240:1dca:d139 with SMTP id
 adf61e73a8af0-240551c4e5fmr26787689637.34.1755015908655; 
 Tue, 12 Aug 2025 09:25:08 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com.
 [209.85.214.179]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce8a838sm30007204b3a.32.2025.08.12.09.25.07
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 09:25:07 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24306318aeeso5404015ad.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 Aug 2025 09:25:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU410aE3vhBdGw7dlpekEvpn5vsrKIwjrU6MVSJFtEop9XmN58nbrXWR3KwbShvoynmTBb4CPBqTFWluRyYtg==@lists.sourceforge.net
X-Received: by 2002:a17:903:2ca:b0:240:8cbb:7c86 with SMTP id
 d9443c01a7336-2430c051fd9mr5044945ad.16.1755015906847; Tue, 12 Aug 2025
 09:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250812132621.119641-3-thorsten.blum@linux.dev>
In-Reply-To: <20250812132621.119641-3-thorsten.blum@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Aug 2025 09:24:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnvUUG7qE_RDKfos1H-baZUT8V5vKx2QNRX14OZ0QnwA@mail.gmail.com>
X-Gm-Features: Ac12FXzitB3rDj5b3cBiPPb6exLXxuQi_RRNYdD80_p1kC8DLuIk3JDtj_3Z_hQ
Message-ID: <CAD=FV=VnvUUG7qE_RDKfos1H-baZUT8V5vKx2QNRX14OZ0QnwA@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Aug 12,
 2025 at 6:27 AM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > strcpy() is deprecated and its behavior is undefined when the
 source and > destination buffers overlap. Use memmove() [...] 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ulroQ-0005wr-45
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Replace deprecated strcpy()
 with memmove() in vkdb_printf()
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

SGksCgpPbiBUdWUsIEF1ZyAxMiwgMjAyNSBhdCA2OjI34oCvQU0gVGhvcnN0ZW4gQmx1bSA8dGhv
cnN0ZW4uYmx1bUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gc3RyY3B5KCkgaXMgZGVwcmVjYXRlZCBh
bmQgaXRzIGJlaGF2aW9yIGlzIHVuZGVmaW5lZCB3aGVuIHRoZSBzb3VyY2UgYW5kCj4gZGVzdGlu
YXRpb24gYnVmZmVycyBvdmVybGFwLiBVc2UgbWVtbW92ZSgpIGluc3RlYWQgdG8gYXZvaWQgYW55
Cj4gdW5kZWZpbmVkIGJlaGF2aW9yLgo+Cj4gQWRqdXN0IGNvbW1lbnRzIGZvciBjbGFyaXR5Lgo+
Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzg4Cj4gU2lnbmVk
LW9mZi1ieTogVGhvcnN0ZW4gQmx1bSA8dGhvcnN0ZW4uYmx1bUBsaW51eC5kZXY+Cj4gLS0tCj4g
Q2hhbmdlcyBpbiB2MjoKPiAtIFVzZSBtZW1tb3ZlKCkgYmVjYXVzZSBvZiBzdHJjcHkoKSdzIHVu
ZGVmaW5lZCBiZWhhdmlvciB3aXRoCj4gICBvdmVybGFwcGluZyBidWZmZXJzIGFzIHN1Z2dlc3Rl
ZCBieSBEb3VnIEFuZGVyc29uCj4gLSBDb21waWxlLXRlc3RlZCBvbmx5Cj4gLSBMaW5rIHRvIHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwODExMTcwMzUxLjY4OTg1LTEtdGhv
cnN0ZW4uYmx1bUBsaW51eC5kZXYvCj4gLS0tCj4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMg
fCAxNCArKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKTXVjaCBuaWNlciwgdGhhbmsgeW91IQoKR2l2ZW4gdGhhdCB0aGUgb2xk
IGNvZGUgd2FzIG9mZmljaWFsbHkgcmVseWluZyBvbiB1bmRlZmluZWQgYmVoYXZpb3IKb2Ygc3Ry
Y3B5KCkgYmVmb3JlLCBJJ2QgcGVyc29uYWxseSBldmVuIGFkZDoKCkZpeGVzOiA1ZDUzMTRkNjc5
NWYgKCJrZGI6IGNvcmUgZm9yIGtnZGIgYmFjayBlbmQgKDEgb2YgMikiKQoKSW4gYW55IGNhc2U6
CgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVn
cmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBv
cnQK
