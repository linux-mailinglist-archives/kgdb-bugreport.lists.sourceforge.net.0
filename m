Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79489026F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Mar 2024 15:58:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rprD3-000795-1M
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 28 Mar 2024 14:58:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rprD1-00078z-3h
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 28 Mar 2024 14:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dYgQMPpl9MqgJ6pOUKLRybn6o9k2/c6Xhse3GpUhIos=; b=ajAhiTuoinqzv7+hfKpmdwqnfI
 iEvragKQuFvvvlpR+kQiq9w5pLM1naArLoFQeYabbVoEt7YIUVNEXL/TE/NbgPmBBeR0ELT8DN73C
 4RhYbKATv8jqH5cjqqkTK2AHAYOhkmJL4dcjkzcoRbRxu2XFTGVK4E7sso46/5F7mR1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dYgQMPpl9MqgJ6pOUKLRybn6o9k2/c6Xhse3GpUhIos=; b=BsVeBpqQb2TKrUJWj9/Xi6eesW
 80Tpqtz9SQ52QX79kf5BdA/909JPVIPkaK8pfKCk+6ASHOVojJpdQmft1XdODz7PRt3qyvpknfCv+
 EDViwKbCeYMNv8NAG8TSiK8hZc6hyX+uJn5f1ww5EsZ5aXPciWvAWxo2eaTkhLsqIfWo=;
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rprCw-0001KD-QU for kgdb-bugreport@lists.sourceforge.net;
 Thu, 28 Mar 2024 14:58:27 +0000
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-368a02d28baso3709555ab.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 Mar 2024 07:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711637892; x=1712242692;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYgQMPpl9MqgJ6pOUKLRybn6o9k2/c6Xhse3GpUhIos=;
 b=HOudlnE0vYJmc2EfXwVPlf8Ju9z74ClkLdDHoo//gPexQDY7AHfrmWksbYZjoMytlQ
 cf8vmR8nvBreaSe7dOTcROYCJN+jNqPBNWejhVWC+xwn8I0ok4vi+jyLEIqogHQ/g3NA
 q48+4ap3Ttw5bDI/6T94WPgQ94pptVm4ZvCdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711637892; x=1712242692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dYgQMPpl9MqgJ6pOUKLRybn6o9k2/c6Xhse3GpUhIos=;
 b=PMfvsiukN9fz7g5U1st5J5h77zm3D2oR1gFmKK1j6BnbfPgiDWZXizeaWPYqrBEE+U
 kvWrt22DQmR5WvqxIIcKWCZaDxoZqIIWcMkcNF5EtCzhyGu9x5et6bOLYmjmf+wEORnT
 TS9K0rIaE5kUgnolM9h5JnLPhnj8Wxq9sPSI9CkxOwcrcuiZMIrzDIUm2HjInJSmCDLe
 CrflyI5jIWNmua+nn9gkHg5kY0nD6w7CVsrVLibBlfV7Lnxci7FHujeLGTwYvWo9mwCb
 iIMGbe5ZMl2yazx0uXfKxglyKdHMzWl2GAMKO63Ejj7flBM/h09/7jUu9LV6oFwI1tLD
 IC/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFgjeQjOgzifEzRbBlr88ht8bs42Sj76OCincxuYdVuJNwUQAOoRLEokEM6y0Qcfuc9NJHBjgaQSlV0NE/A6aAXEp+AI1La/TseZC5V34Nxa545tQ=
X-Gm-Message-State: AOJu0YwJK68+Up88w2LL/UMyaMsB3uLNcZ9awm82BDrb9keJUmBa6baB
 LAllWVK/oYA2YW/ud2DArHuO2G1HwoTsuMSuem68N71CYZ+DOGcsh7iNa4SNNEpk3ErTvEQjBDc
 =
X-Google-Smtp-Source: AGHT+IGCKgvsRCvIWF0+1aObHftt3Z4d/aev8q65zNqoS7bkW5foMKvg+tSMzH014RJLeMNshEyx0A==
X-Received: by 2002:a05:622a:1051:b0:430:eb66:95e4 with SMTP id
 f17-20020a05622a105100b00430eb6695e4mr3237743qte.39.1711636299830; 
 Thu, 28 Mar 2024 07:31:39 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 u18-20020ac87512000000b00430eb19dd06sm651113qtq.91.2024.03.28.07.31.38
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 07:31:38 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-431347c6c99so286621cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 Mar 2024 07:31:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUak6eLc5j8oS6CLr5OpLhzxmNwO1+4zDj29Fk/03vDX9XgArXqgVrjf21/r6Ttl19jbAU5sFTmEfHwk0wNbEFWXbfG+TGrCIWAmpra9FcIFiN0yAA=
X-Received: by 2002:a05:622a:5b8c:b0:432:b4d0:ab2c with SMTP id
 ec12-20020a05622a5b8c00b00432b4d0ab2cmr192920qtb.1.1711636298118; Thu, 28 Mar
 2024 07:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240328140015.388654-3-thorsten.blum@toblux.com>
In-Reply-To: <20240328140015.388654-3-thorsten.blum@toblux.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Mar 2024 07:31:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3Cpo38ss1nFvPMbXadaXXpVuN5jdfUKZS4ngDLQX_wQ@mail.gmail.com>
Message-ID: <CAD=FV=V3Cpo38ss1nFvPMbXadaXXpVuN5jdfUKZS4ngDLQX_wQ@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Mar 28, 2024 at 7:03 AM Thorsten Blum <thorsten.blum@toblux.com>
    wrote: > > Fixes the following Coccinelle/coccicheck warning reported by
   > string_choices.cocci: > > opportunity for str_plur [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.173 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rprCw-0001KD-QU
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Use str_plural() to fix
 Coccinelle warning
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE1hciAyOCwgMjAyNCBhdCA3OjAz4oCvQU0gVGhvcnN0ZW4gQmx1bSA8dGhv
cnN0ZW4uYmx1bUB0b2JsdXguY29tPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgQ29j
Y2luZWxsZS9jb2NjaWNoZWNrIHdhcm5pbmcgcmVwb3J0ZWQgYnkKPiBzdHJpbmdfY2hvaWNlcy5j
b2NjaToKPgo+ICAgICAgICAgb3Bwb3J0dW5pdHkgZm9yIHN0cl9wbHVyYWwoZGF5cykKPgo+IFNp
Z25lZC1vZmYtYnk6IFRob3JzdGVuIEJsdW0gPHRob3JzdGVuLmJsdW1AdG9ibHV4LmNvbT4KPiAt
LS0KPiAga2VybmVsL2RlYnVnL2tkYi9rZGJfbWFpbi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFu
ZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
