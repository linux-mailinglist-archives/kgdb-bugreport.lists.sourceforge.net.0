Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 323EEB0AC78
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 19 Jul 2025 01:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTFScQcAAKHNAsIvb+9H6/zk03thLPKJrthcy4dLxkM=; b=hxJcL8GuBsNIUhOjrpRH27lzwU
	hhuFm7VJJQSF5xqdhVaZevDHcdXmkiTXSUQCH/aiipxDRXjGWkoYMKdSEwSBukME4+lYUOAavJkLx
	9F/8xKDoyguQZNSbJ6jwL5lJyUr7acaLxHGyhH8DIN1uqTVx0pnRPRkMXCVDJAYi/kkM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ucuDO-0007Bz-Jg
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 18 Jul 2025 23:10:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ucuDM-0007Bp-Tg
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 18 Jul 2025 23:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XCekbMSEmyxIAVzfncRaEHsXG0dam6IEJBqPkNUa8Bk=; b=OrOFugx1O10M9hk6XDL08F/tvD
 3n8DlDrn8ewJKfxJnmtUBcV8H3KvS2rWn0EJXVyZD3g3WvqHtnz67ik2iUCX2Z40OVWHUR+jTSlT0
 VL8AuwcIa30yraUCEjCW7IXd34m/UMLX1zcJfkB0Pa/Uwexw9B+CSaD1xFKtTh5bpW9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XCekbMSEmyxIAVzfncRaEHsXG0dam6IEJBqPkNUa8Bk=; b=mXedj2ZGhrKx93FwXhdfH07wIt
 C4m1YZI76sw+EilCuW0BvUGtc4wPp9imgSaLFMJJmbNxbdEKdAndQIjiQLEKU2KfN3CjbQM0wcLzO
 SLHpPKFscaHaooBMmfrXAoMMnptiTUduGmxWJn62sD7GYWsMTEV2k+Vhsi2v+ZwfIN5M=;
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ucuDM-0001mJ-DE for kgdb-bugreport@lists.sourceforge.net;
 Fri, 18 Jul 2025 23:10:04 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-301a83477e5so533780fac.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 18 Jul 2025 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752880193; x=1753484993;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCekbMSEmyxIAVzfncRaEHsXG0dam6IEJBqPkNUa8Bk=;
 b=laMbgCKoahdRx9WKnUCKfC6VsPWN/KddrnDMMRjn714pwO7FGGwfst+f3emGv2bEs+
 8gVAuX33ROB2iUpHjQRLCFp/qzmyk83a9AJgFV4N/cx8Nk8t7PoNi4/L5VcQuEYvsQiv
 0tmZ6qoqO2MZRbkMdNF9YMODJY0IBzfAYRiCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752880193; x=1753484993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XCekbMSEmyxIAVzfncRaEHsXG0dam6IEJBqPkNUa8Bk=;
 b=n4xXUpUUvRtrgkzi1oLQ9LBoLAyHvkcPRFZbYpaC7BBpawggVXX+rYgc+Us0QpI1wz
 b54JO+9fp/SpMMpJqHXvXGHLWcXBYhPYstV7QnO0AmZJhdIUlaqvrkO5woM40f7ik5um
 KI/Y1Odt+N9xyMf+dX6p3vnrxorSWHi/Q/RB2baubiinohdCypWM6DJubsLsEu8irMvG
 tVDUTXJ/B/1wWrTkNmnU2GKBVuHK0paPF19jDYTCFzFOUYrAwsBLr9/UbF2zUqO12pMH
 n87k0cvuMtNoHLCZ69rpkGKXGoCywQr79rvVi1QDfFuxH3t/2/QGKsFZ6aiCHJYL1gL5
 N/+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbjU3vxhk2fpvMUpZNHTQT/pKYFeJxvU18kfZsHjhuLOlhWcaS3HOcJs8WaIrelFlhQakhOLH2gzfAxTOMqQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzIzlzwpjidLQDSKYAXhs42CpajGdwj9Nozoabbno95DZyLEnOG
 fjek5/7+zRSqQ1yhOxjJ8/9XPwP8/r0kF1wpJ1wQW4tfpwLMw50NmN+Rq1eH2K5fA/by/BitS0c
 Rcjc=
X-Gm-Gg: ASbGncu4UZn+s79o/FuULlkKW9ePJ+Tcut0QLhVriZyB25ZQ1RfPZfWhzjkrnSSvvT6
 o8Mig/LAjr1a9GfNSNCEEZcty8q5kyrOYXw2rsbWRZaSDn31Huoy/pWiIIRXbl7HglEJqIX2zDC
 GAsHgl1HivLgJLNKgPZWDeeyuWz6BKqOTgritDi/Tj4f8qVkk11Jjg8aaF3bGNwa6o5UfFa5OKQ
 ILlREO1Z8HdJWNV/0NVKmnGOZ/b1wOQZ+rRDNggaKvX5xPVnDbXUh4ZTc8KQlflH4bZ8UZ+TjUJ
 WJFTZn6oe5qqMgvmIBHnlUlYa36gE6dFo/06zScAXlyfEMrRjGg7bVUfAiBqpI7R8Z0oQTIt+tD
 vX/dCCihuFVEfBscJ4w/a2IuZWm0T6TP8AVBN15L5bY5JFJC35WdUEnjb8xYSwg==
X-Google-Smtp-Source: AGHT+IH9e1xCDf317AOXWjlYq4zNKxG+DwPNpcAe3F+avn/w9dYtV3WwcDI1ZlhEzuIX0TOQGcHD9Q==
X-Received: by 2002:a17:902:d60b:b0:235:dd54:bce1 with SMTP id
 d9443c01a7336-23e24f49451mr180780825ad.15.1752878937537; 
 Fri, 18 Jul 2025 15:48:57 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e2d91sm18591075ad.44.2025.07.18.15.48.56
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 15:48:56 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-315cd33fa79so1609190a91.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 18 Jul 2025 15:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVb2lgSA6qRY0LnBOztT3qq+8aKu3zf68ooJImxm1Abs6rFeWnMAooKlXHF7OCkHXg+JCqf+w/N3B0jtljSRg==@lists.sourceforge.net
X-Received: by 2002:a17:90b:5307:b0:311:baa0:89ca with SMTP id
 98e67ed59e1d1-31c9e79bc53mr17025524a91.34.1752878935739; Fri, 18 Jul 2025
 15:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250718213725.348363-2-thorsten.blum@linux.dev>
In-Reply-To: <20250718213725.348363-2-thorsten.blum@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 15:48:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W1tgwvajXD6mcggHKy=Q7EN8wLx4nSJgy0NJBzHLBnSg@mail.gmail.com>
X-Gm-Features: Ac12FXxufG3DdfXgWkFesZeMyd_2GFfXRNaPb_AZ2xn1G3aBVcusp6YGrWqqY7c
Message-ID: <CAD=FV=W1tgwvajXD6mcggHKy=Q7EN8wLx4nSJgy0NJBzHLBnSg@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Fri, Jul 18,
 2025 at 2:40 PM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > strcpy() is deprecated;
 use strscpy() instead. > > Link: https://github.com/KSPP/linux/issues/88
 > Signed-off-by: Tho [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.160.53 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ucuDM-0001mJ-DE
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Replace deprecated strcpy() with
 strscpy()
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
 Zhang Heng <zhangheng@kylinos.cn>, Daniel Thompson <danielt@kernel.org>,
 linux-hardening@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEp1bCAxOCwgMjAyNSBhdCAyOjQw4oCvUE0gVGhvcnN0ZW4gQmx1bSA8dGhv
cnN0ZW4uYmx1bUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gc3RyY3B5KCkgaXMgZGVwcmVjYXRlZDsg
dXNlIHN0cnNjcHkoKSBpbnN0ZWFkLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAv
bGludXgvaXNzdWVzLzg4Cj4gU2lnbmVkLW9mZi1ieTogVGhvcnN0ZW4gQmx1bSA8dGhvcnN0ZW4u
Ymx1bUBsaW51eC5kZXY+Cj4gLS0tCj4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX3N1cHBvcnQuYyB8
IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpuaXQ6IFNpbmNlIHRoaXMgb25seSBjb3ZlcnMgdGhpbmdzIGluIHRoZSBmaWxlIGBrZGJfc3Vw
cG9ydC5jYCBhbmQgbm90CmV2ZXJ5dGhpbmcgaW4ga2VybmVsL2RlYnVnL2tkYiwgcGVyaGFwcyB0
aGF0IHNob3VsZCBiZSBpbiB0aGUgc3ViamVjdApsaW5lPyBNYXliZSAia2RiOiBSZXBsYWNlIGRl
cHJlY2F0ZWQgc3RyY3B5KCkgd2l0aCBzdHJzY3B5KCkgaW4Ka2RiX3N0cmR1cCgpIj8KCk90aGVy
IHRoYW4gdGhhdCwgdGhpcyBsb29rcyBmaW5lIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IERvdWdsYXMg
QW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dk
Yi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
