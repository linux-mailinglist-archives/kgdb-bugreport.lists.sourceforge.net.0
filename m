Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FC4912E20
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 21:52:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKkJR-0005qR-IW
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 19:52:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sKkJP-0005qA-KJ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 19:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jMKGPY/7u8TnNMIfIPhSGai4Rza/s0QV24uQBC0AouE=; b=H/ZnyWXsb9qGplWHS8+mX8wDb3
 dSn7mNHJjIQkSTEhbsH+OcMG41Bcpd2Kj+lQyuT0EGNEcDIF+u4xq6UcOMu2TRZMxmcWLsYzCb/tV
 NoQszrVyKk1dEcDA/QLl72URDCJdoCypUwMFuT1HbBxvDIJezgzWI+qKy+EsQ6Caxo3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jMKGPY/7u8TnNMIfIPhSGai4Rza/s0QV24uQBC0AouE=; b=f1E0sbigpA7BL3SKnaigJhsfpZ
 re0AyKNLU9Np/rlhliCTxS9aj7YS0N6Xs7UQ5pygGgvDx0JyWiUGNr5FkezorEImuSVYEhXTCZQ/c
 Wne7J8ypnGjLxf21eFJEAof+2j1VvGdLcDpxr+U9A7/vtaYrO3iPPpRuy5ltQa/cna/8=;
Received: from mail-qk1-f172.google.com ([209.85.222.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKkJQ-00079e-30 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 19:52:43 +0000
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-79bc769b014so155151185a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718999550; x=1719604350;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMKGPY/7u8TnNMIfIPhSGai4Rza/s0QV24uQBC0AouE=;
 b=go6RXJWty9rnqqX2Zc2zXppK5x+1x774zai3WwLU5e6Jrvoxt80y2EscIWxgYDiHaR
 bHGc2yFhwXM5pjult2pv+b/dxERuujaJ/M1a6FItNdLF+SnV1bYbPEnBKfmidkU9Pn3/
 wY56E1nQDqE5HfjPaqO6lrWra62DRmK037Z9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718999550; x=1719604350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMKGPY/7u8TnNMIfIPhSGai4Rza/s0QV24uQBC0AouE=;
 b=gbNNCKXJq6hJTP/+RMfr8X+lgunWCAQApHTFs3EPJQ6mhS+PmLjXsVWmleDAcGckmo
 /d1WmAe38dKtiB65SjDAJijhMUA7Xmv/onHHCV3T6BuQR0X0bpb1FMLIlSsIR0U7mZUH
 CqEKti0Jmqxjb0qnlvLJMRZBKtlvvt7cFpCtTMJis0n6ujqTJg9ifun8wXZtg9MnSF8q
 EPS3Y2AOL7FX8dyv4HeVJgVaOHBA8yEC/0TpeBfqiyJBjPWB5gNEWpw60ggmT8TEZp0u
 okmUPrg9lwQSeAwkhaQwnc0tsIngXFNPm9LQ/CXsTUvbM/wO1BKVgx9kNBK1Mvs5edAf
 CqcQ==
X-Gm-Message-State: AOJu0Yxznkro5FCSH4+pL/NnM7aKnwFPCWuPVvTABBxmUJyBmZo8B5UJ
 SVQHECBIagiHikuLEfiCgMpLJQD0VP/MB16VE2BXbZFN/H8vtTo+9My/cgeq+nptwThFZd1H1qo
 =
X-Google-Smtp-Source: AGHT+IG7efjPWd4s53nCg1OpXqLMFgBUVh6cebuYfj5Y4IY4R5Nc248gLZx+efGKBjhL8EldnzGFeQ==
X-Received: by 2002:ad4:5dea:0:b0:6b5:1584:62bf with SMTP id
 6a1803df08f44-6b52b79e6c7mr12122386d6.6.1718999550557; 
 Fri, 21 Jun 2024 12:52:30 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef58fcesm11578486d6.116.2024.06.21.12.52.28
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 12:52:29 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-44056f72257so518481cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 12:52:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1a01:b0:444:92a6:188a with SMTP id
 d75a77b69052e-444ce2be63dmr297041cf.9.1718999548030; Fri, 21 Jun 2024
 12:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.13.I572fb3cf62fae1e728dd154081101ae264dc3670@changeid>
 <20240618155938.GG11330@aspen.lan>
 <CAD=FV=VTegKBcHY9pgfFUs7T1Ug5r1yg+CxLE6sBhBBt4csfkw@mail.gmail.com>
 <20240621154349.GE285771@aspen.lan>
In-Reply-To: <20240621154349.GE285771@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Jun 2024 12:52:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UHh1L13GDSQrSQMJOwwkcFku5X9zCuKt0aZw3Qq9a+VQ@mail.gmail.com>
Message-ID: <CAD=FV=UHh1L13GDSQrSQMJOwwkcFku5X9zCuKt0aZw3Qq9a+VQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Jun 21, 2024 at 8:43 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > For example I have long wanted to be able to let > the user see
    /proc/interrupts before the usespace comes up [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: chromium.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.222.172 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.222.172 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.172 listed in wl.mailspike.net]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.222.172 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKkJQ-00079e-30
Subject: Re: [Kgdb-bugreport] [PATCH 13/13] kdb: Add mdi,
 mdiW / mdiWcN commands to show iomapped memory
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
 Thorsten Blum <thorsten.blum@toblux.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEp1biAyMSwgMjAyNCBhdCA4OjQz4oCvQU0gRGFuaWVsIFRob21wc29uCjxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBGb3IgZXhhbXBsZSBJIGhhdmUg
bG9uZyB3YW50ZWQgdG8gYmUgYWJsZSB0byBsZXQKPiB0aGUgdXNlciBzZWUgL3Byb2MvaW50ZXJy
dXB0cyBiZWZvcmUgdGhlIHVzZXNwYWNlIGNvbWVzIHVwIGJ1dCB0aGUgc3Bpbgo+IGxvY2tzIGdl
dCBpbiB0aGUgd2F5LgoKQlRXIHRoZSAiZ2RiIiBzY3JpcHRzIGFyZSBzdXBwb3NlZCB0byBoYW5k
bGUgdGhpcyB3aXRoCiJseC1pbnRlcnJ1cHRsaXN0IiwgdGhvdWdoIHdoZW4gSSB0cnkgaXQgcmln
aHQgbm93IGl0IGRvZXNuJ3Qgc2VlbSB0bwp3b3JrLgoKLi4uYWN0dWFsbHksIHRoZXJlJ3MgYWxz
byBhIHNjcmlwdCAibHgtaW9tZW0iIHdoaWNoIHNvdW5kcyBncmVhdCBidXQKb25seSBoYXMgdGhl
IHBoeXNpY2FsIGFkZHJlc3Nlcy4gOigKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
