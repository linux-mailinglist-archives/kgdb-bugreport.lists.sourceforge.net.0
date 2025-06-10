Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE65AD46EF
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 11 Jun 2025 01:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi7+WfoREfTeWQXrcoFKMTPH9p7HFYqjdXc++SuC72g=; b=Z7INRqeAjuO8//jLX/WRLm8efj
	F8NCtFVUkMeWPLHOlKwq39LDwrWaTB2GQV9bamWt98rQa+vKYq/GRF2bCmtJnkH5TQLPVOREMFqF0
	Ox69EaZZU8SFqU8KX3hQ2B1DHfNg5FxdDN8gaD1UxENbNglvhy81mqQpyHiZItwqtPiY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uP8d3-0002cI-Gh
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 10 Jun 2025 23:43:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uP8d1-0002cA-Up
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 10 Jun 2025 23:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DiGLH/pU/piZfQOirrWyYrCH57huKV6y+4CiDqtk8kw=; b=OhktWZhuzzhnJSaByM8JhD2fla
 Uk7orXV+O2f5QCDYUHjJrEbD4zylmAUEKIhZXEkKV2PBRpLV6cuMFur0BBxNy/TZsDZ0lIW+ENzJ9
 tsPzwEg7iVsc4Ux4iLtmgmjtQeYdH1RnfDFhT0gh07I51U0qTwg+vgMP4g3w4aA2qBm4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DiGLH/pU/piZfQOirrWyYrCH57huKV6y+4CiDqtk8kw=; b=GSp+N8N0s6WwCRnI+AWxNuTco7
 Y1hZ9ar3iR6pygb83usHK490MbgJykCQoFXKLd00RlqNymVssUTnHB7HuS679UR1Ts0+p8B1FFRIA
 Yb2hmgy2AsCklWP8abZIrlF5mcwJvki1bJfhQRHlrhsiTFy5p285xtk5lbxFJ5T/UD1w=;
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP8d1-0006uj-KT for kgdb-bugreport@lists.sourceforge.net;
 Tue, 10 Jun 2025 23:43:39 +0000
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-87ec80fc3b4so2133333241.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 10 Jun 2025 16:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749599008; x=1750203808;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DiGLH/pU/piZfQOirrWyYrCH57huKV6y+4CiDqtk8kw=;
 b=jlubJEWz1GCBC6519YmSkB56nJe8QENktQQuGO7oMM+413cWm20+AQIJGIdEONHvKA
 wNMZQ5TZqMPuL3BMnEjCiYTXmIOszNRGTVxUiB5qZo6wwX1xr+ekDK9wjMFMRFeB+sb6
 5Fg7CK4Lv4JW0RAF11QlMdfvjPnZPiG46IBx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749599008; x=1750203808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DiGLH/pU/piZfQOirrWyYrCH57huKV6y+4CiDqtk8kw=;
 b=BNOKn+ob0vzDFJCb0+YF5teXJ1N404KkKyWxkpiTZ7P3HNBhm/nSOIANGYRHZdby8M
 3/eiu0ibJ/kqCDl8JSNV2nRUgQ4RnA29V/GnshZexYCggWpRUgcij+3+lsi3MGGzWyQ5
 ktjCAHpLcs/s9T5aodcDJloDJq1l0E1rld8qbYdwer4w71K2ZCsoLLcfJNhi4B95S8Jb
 IYDLg2yq9Vpd2+/Oqjvhgpl4vaaMXPwh/yegxumDziHP+piyNeFvmCX4pLx9GL5duZJO
 smWpblGY+0r5fd5hIYnJB2ACvoRcE6248008m5b2+E8KlrSv0z3UtUmWPgvsvgPAnVvA
 0eNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmRz+Fj6sPw9g23/jBHpk2Kcd+SO8fbiT+s0g2ToxG0vR6XNpbd1pSgFEEYLRgfxvrAhoilcXf2ek/WxYORQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzsbft/OBUdu0qZf1r9ijEgY7Sxpyg2skgIxCc7i8NjFfvCmkUE
 EVU2GvLbtkUCBcJMC78J5LT/fo5vRrh7lXUO6yS+h483s+S/BZpLZfF2xguRByEbS3vBZF9SXST
 KZcg=
X-Gm-Gg: ASbGncsPV/OXP4Leeth68FYtXZ7qMedHo9xW3fr0S7ZYpvpJdV+cPBwqzpXKelSf6OM
 yZCHvQQvLK8eJ4oQSseD0RSDjZNHxRq7QMniMoHXYhgYfPHjvP44POlQ4erwOzqxzEpa3f4D/g+
 FeaQxiSZwkeK/fUpPS270zvXa+KMgH8Pt8PfFK3ArxsDrrp3C28OskbBDAvr6NGWPHX0ynhhWEr
 1NRgcc7aqsHGx977qWg1v0Ti+BmriYySkyQjgaL4lsWZn4p6uqdsNXUzpMVRE00A8PprU/z8i1Z
 rmubl7VmNmb451OAD9u8fPXfgFNP9mD8y8x9trReYDyPFgFB06KjiSEd+9vZpmQ7pAaK/iWyrZI
 uugxJq6zQ+OAzkl2ToZzSDKOUgQ==
X-Google-Smtp-Source: AGHT+IEJWiEctaZazikm/ma75B/ht7xjPsjU9wnRTyxfuWez4EyEbb+YmJWdAdTxCfApf/88fgm5Ew==
X-Received: by 2002:a17:902:e842:b0:21a:8300:b9d5 with SMTP id
 d9443c01a7336-23641ab1ae0mr14107905ad.23.1749598693006; 
 Tue, 10 Jun 2025 16:38:13 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fc6f8sm75908395ad.136.2025.06.10.16.38.10
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 16:38:10 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-313910f392dso1919814a91.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 10 Jun 2025 16:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVIuUZfKpB/iGrNKGUQ4BF3eJ8XCKC5rELfGevP6VoAUn2Df0DEwIn1pHADfUKHXr6EcxXeIMqt8u7aMa4xgw==@lists.sourceforge.net
X-Received: by 2002:a17:90b:1647:b0:311:df4b:4b82 with SMTP id
 98e67ed59e1d1-313b214a8f5mr622260a91.4.1749598689503; Tue, 10 Jun 2025
 16:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250507104337.201695-1-colin.i.king@gmail.com>
In-Reply-To: <20250507104337.201695-1-colin.i.king@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 16:37:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjZwN9dga2OXYY1dBAe=B5QkeZQhEygA_wxXvLatY3rw@mail.gmail.com>
X-Gm-Features: AX0GCFtZvEBl-EmIFHzeWRfTaVmPsBdOiaZhoqVl1uW5_aP2qYsrjz41aGR7LCY
Message-ID: <CAD=FV=XjZwN9dga2OXYY1dBAe=B5QkeZQhEygA_wxXvLatY3rw@mail.gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Wed, May 7,
 2025 at 3:44 AM Colin Ian King <colin.i.king@gmail.com>
 wrote: > > The check for scancode 0xe0 is always false because earlier on
 > the scan code is masked with 0x7f so there are never [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.52 listed in wl.mailspike.net]
X-Headers-End: 1uP8d1-0006uj-KT
Subject: Re: [Kgdb-bugreport] [PATCH][next] kdb: remove redundant check for
 scancode 0xe0
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
Cc: kgdb-bugreport@lists.sourceforge.net, kernel-janitors@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIE1heSA3LCAyMDI1IGF0IDM6NDTigK9BTSBDb2xpbiBJYW4gS2luZyA8Y29s
aW4uaS5raW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgY2hlY2sgZm9yIHNjYW5jb2RlIDB4
ZTAgaXMgYWx3YXlzIGZhbHNlIGJlY2F1c2UgZWFybGllciBvbgo+IHRoZSBzY2FuIGNvZGUgaXMg
bWFza2VkIHdpdGggMHg3ZiBzbyB0aGVyZSBhcmUgbmV2ZXIgZ29pbmcgdG8KPiBiZSB2YWx1ZXMg
Z3JlYXRlciB0aGFuIDB4N2YuIFJlbW92ZSB0aGUgcmVkdW5kYW50IGNoZWNrLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmkua2luZ0BnbWFpbC5jb20+Cj4gLS0tCj4g
IGtlcm5lbC9kZWJ1Zy9rZGIva2RiX2tleWJvYXJkLmMgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9rZXJuZWwvZGVidWcva2RiL2tkYl9r
ZXlib2FyZC5jIGIva2VybmVsL2RlYnVnL2tkYi9rZGJfa2V5Ym9hcmQuYwo+IGluZGV4IDNhNzQ2
MDRmZGI4YS4uMzg2ZDMwZTUzMGI3IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9kZWJ1Zy9rZGIva2Ri
X2tleWJvYXJkLmMKPiArKysgYi9rZXJuZWwvZGVidWcva2RiL2tkYl9rZXlib2FyZC5jCj4gQEAg
LTE0NSw5ICsxNDUsNiBAQCBpbnQga2RiX2dldF9rYmRfY2hhcih2b2lkKQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gQ1RSTCgnRicpOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBpZiAoc2NhbmNv
ZGUgPT0gMHhlMCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+IC0KCldoYXQgYSBnbG9y
aW91cyBiaXQgb2YgdW5kb2N1bWVudGVkIGNvZGUuIEkgYWdyZWUgdGhhdCB0aGlzIGlzIGRlYWQK
Y29kZSBhbmQgc2hvdWxkIGJlIHNhZmUgdG8gcmVtb3ZlLgoKUmV2aWV3ZWQtYnk6IERvdWdsYXMg
QW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dk
Yi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
