Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE817443B0
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Jun 2023 22:57:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qFLBD-0007vW-U9
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Jun 2023 20:57:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qFLBB-0007vE-OK
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 20:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u15VNGIEnyJtLjVOKUkj2c2i24i64I8f65ANMrqewQM=; b=gXVrKSHJHoitq2JFyYDRxDskP3
 75zWPwI1pe4nxu2/BbImKCoygvG7XQGRD28LAkW32qy0cTBfFdZifKu7hf9/lT224f/0Nd0m9NF6C
 9YPmybvdfpL39EfMaY2SEJedfUepniwpxp0Kzr8AuYaRFOk1CeboRc2STzjytbKRlFV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u15VNGIEnyJtLjVOKUkj2c2i24i64I8f65ANMrqewQM=; b=UuIi4fwGhUB5Ip+Xg4lz8266iV
 hHSCcfBhizddLU4ym3wlqGE9Q0Gt0bQUGt9v69QtPlwYmoCaX9yLewq0ir4Svn9as+P8SHMzcT1fN
 I/rMOiYhuNS8VDsw02cTeAiv+EKXBTNUKkEHQexHvLbVOboRnNRCL51PqURA4/Bu+FR0=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qFLB7-002SdY-AM for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Jun 2023 20:57:21 +0000
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-51d9865b8a2so2414707a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Jun 2023 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688158628; x=1690750628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u15VNGIEnyJtLjVOKUkj2c2i24i64I8f65ANMrqewQM=;
 b=btJkZ0iLQG+NRsVw2AQQDXuuT9vpF1tYhpTZYL4yb83A0vdq+iWygwiBo2GuM/3Jfr
 xh6nRSePdbR29E9916Q9Cvl+JjaqsXcN16jhamj9j7OiK6DFM2Jvxrw/p4YnhLXmNKBH
 09NSP9ImnpOhpgkEjSPPJ1LtxXhbKGgP6taD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158628; x=1690750628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u15VNGIEnyJtLjVOKUkj2c2i24i64I8f65ANMrqewQM=;
 b=A9vAQcKUwstkWhIFNv3WYzaW7HwZ7Pxraj/vai5htKUQX8RfPBTyDE1kQGYz70qVTc
 C/e99fl1iWdhSWLR8d+IenyW/cAGobgFPx00VxAB4n+MSvfagtwBZk+AC3eVR+KsbvrX
 QCDEA3J/tDV6RO4yBCa3lyg6zud/499mWywjE2Ot2de0lAsXK0KQr29bDd7B16xyW67/
 oXw7PXKioUrpssAV3dGHWys2cxLrJY0Nr/ZdozsZkrOQwUqRsaxgcEl5RFTrKKC2aP7h
 vym+TeRw1BdEqwqM/+4+V8TOvBJ0uhq0qpCuihnz3m6n34C1N0bjdHf9ECs/i+/QZ1cT
 HiKQ==
X-Gm-Message-State: ABy/qLacME37Lwi8skcQSOYTiYVq8/EDqH+mOTZiNx4YfVBlpSJEXnmV
 /MVGVCRBYTH6dWGUWXjzjc0pRmAU6aN1qW43ILVSWA==
X-Google-Smtp-Source: APBJJlE2+NWH63LUz2QeOGtBR6l85WX17GPOmUJXAqO2+99QXV9FxXvMJQcvGSvCfRbr49kJubBWHQ==
X-Received: by 2002:a05:6402:1b1b:b0:51a:3760:b4c8 with SMTP id
 by27-20020a0564021b1b00b0051a3760b4c8mr2232253edb.14.1688158628723; 
 Fri, 30 Jun 2023 13:57:08 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 z24-20020aa7cf98000000b0051bfcd3c4desm6946782edx.19.2023.06.30.13.57.07
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 13:57:07 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so623a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Jun 2023 13:57:07 -0700 (PDT)
X-Received: by 2002:a50:d544:0:b0:50b:c48c:8a25 with SMTP id
 f4-20020a50d544000000b0050bc48c8a25mr23065edj.6.1688158627455; Fri, 30 Jun
 2023 13:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230630201206.2396930-1-daniel.thompson@linaro.org>
In-Reply-To: <20230630201206.2396930-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Jun 2023 13:56:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCa5LugcNwosHOPG8GSVfUEnDB9hbXWEop0z0ner12Yg@mail.gmail.com>
Message-ID: <CAD=FV=WCa5LugcNwosHOPG8GSVfUEnDB9hbXWEop0z0ner12Yg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Jun 30, 2023 at 1:12 PM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > kdb_send_sig() is defined in the signal code and called from kdb,
    > but the declaration is part of the kdb int [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qFLB7-002SdY-AM
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: move kdb_send_sig() declaration
 to a better header file
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
Cc: kgdb-bugreport@lists.sourceforge.net, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEp1biAzMCwgMjAyMyBhdCAxOjEy4oCvUE0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBrZGJfc2VuZF9zaWcoKSBpcyBk
ZWZpbmVkIGluIHRoZSBzaWduYWwgY29kZSBhbmQgY2FsbGVkIGZyb20ga2RiLAo+IGJ1dCB0aGUg
ZGVjbGFyYXRpb24gaXMgcGFydCBvZiB0aGUga2RiIGludGVybmFsIGNvZGUuCj4gTW92ZSB0aGUg
ZGVjbGFyYXRpb24gdG8gdGhlIHNoYXJlZCBoZWFkZXIgdG8gYXZvaWQgdGhlIHdhcm5pbmc6Cj4K
PiBrZXJuZWwvc2lnbmFsLmM6NDc4OTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciAna2RiX3NlbmRfc2lnJyBbLVdlcnJvcj1taXNzaW5nLXByb3RvdHlwZXNdCj4KPiBSZXBvcnRl
ZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkZXSVc6IHRoZXNlIGRheXMsIEkg
dGhpbmsgY2hlY2twYXRjaCB5ZWxscyBhdCB5b3UgZm9yIGEgYmFyZQoiUmVwb3J0ZWQtYnkiIGxp
a2UgYWJvdmUuIEl0IGlkZWFsbHkgd2FudHMgYSAiQ2xvc2VzIiB0YWcgdG8gZm9sbG93CmltbWVk
aWF0ZWx5IHdpdGggYSBsaW5rIHRvIHRoZSByZXBvcnQsIG9yIGluIHRoZSB2ZXJ5IGxlYXN0IGEg
IkxpbmsiCnRhZyBpZiB0aGlzIGRvZXNuJ3QgZnVsbHkgYWRkcmVzcyB0aGUgaXNzdWUuCgo+IFNp
Z25lZC1vZmYtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+
CgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVn
cmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBv
cnQK
