Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5966979C3F
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 16 Sep 2024 09:49:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sq6UL-0003ix-Jz
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 16 Sep 2024 07:49:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sq6UK-0003iq-Nf
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Sep 2024 07:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bRuvIqIMwhOwH+lOG9lXtXVM6bFb+PSyQglSW2kHCV4=; b=lC3iDYi+VZq9hFu2BscsRaLTVi
 +SJHGouuKVUxSe313tNK65vRKLXgvgvVDNfkXkUlgSFbryvFPRk5mvv1IIH0JcBw6ti+7P8xDBHjx
 eMKY4zTOADDFBRvwnJA8BzKes9hRmrR5w7+cqPf5KYV/dDOOBbgBe/IlX2OgElCApBK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bRuvIqIMwhOwH+lOG9lXtXVM6bFb+PSyQglSW2kHCV4=; b=RHnx4FbyTls3+P9rLmEem2rlpU
 QJ4ulg4J/Gwb3zu4s3L+aqYOzGg1+kyLe3hZ9GzdraJIDBo3YzrDxoDbozU3zEy3VrvIiLGlsaS/N
 rKk1qrykfLAmQgLub6zohS14d3qzQI+dbTAYGLIHn0lR56WKSInRQn80FID7z4ckILG0=;
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sq6UJ-0007T5-FK for kgdb-bugreport@lists.sourceforge.net;
 Mon, 16 Sep 2024 07:49:36 +0000
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-458366791aaso21707261cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Sep 2024 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726472963; x=1727077763;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bRuvIqIMwhOwH+lOG9lXtXVM6bFb+PSyQglSW2kHCV4=;
 b=W4IRHXjkuWNuHgWSFMHmNVrfSaPi6hNVyGrmtlUpATUeH3nyXRdMiOTCasdJ3D7u+2
 +X7u01uwIcNXgENbcGQiSsgH/3rWqanNWHSOgryPqSclMcQjNynE2vmC7pLojDLmaIF2
 tgTGHbAW0xkLmh7ozPPH/VDbn4VqckoosoGNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726472963; x=1727077763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bRuvIqIMwhOwH+lOG9lXtXVM6bFb+PSyQglSW2kHCV4=;
 b=NeqCUviqYv9z23RREWQGXgjKacpr4c+GbUKCGNKT2qMDn7u8ot/OTKaqLjTHiXuJm2
 tdQW/HEzyH4h7xN4BL0vmiCVNiEDSmiOjn2P3TWAVlHW+HyOV3aiBXT09j94k6mGFVAx
 UzCI5F3IUIoXgdT+K3YIigpp/M1XajX1bsFVj7s7nnluthR/yAp0Au2yWywQfZoVVF8z
 ouH4KnKI576GwGfYrIzje9hlnrDRBzkcC4EWJhHInsSpo6YT8ERlEUX39/r16Un5alUV
 6NLk58EA6syiFZfPlxuiSDNT+oJS3HZvmSk4DxrhfwtFez21XANq1PaKhO0bOb207hMn
 9OTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1LYLGcm9nE7NiQVbzlhTsYE1qZN2UBwiPmGCeOrDtxO/CdWaNgbCp6T2p8GsNCrHhyVbqDvgEj3ZVI7jW3A==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzLyxDpAyUZxEi6KsWi4SB+d5+p+aLDUBDgreN/xHW7pGu5EbMd
 Nb8wNtfJuYvxTDtm+YFJkCOvgN/C/WNOd4OrDgpp+EhkvTDkrnYWdMdotd45QdBWuQrVH8v7NN2
 8dg==
X-Google-Smtp-Source: AGHT+IFfZuCvSMr8TBiBajj9NZNCCLscjLXXRnHTfwmuFa103IOJpLHVVYFQpSVpl2GoYhGTPyVC/Q==
X-Received: by 2002:ac8:5fc2:0:b0:458:34ee:3a4b with SMTP id
 d75a77b69052e-4586029dc10mr265110571cf.6.1726472963514; 
 Mon, 16 Sep 2024 00:49:23 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com.
 [209.85.219.41]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-459aacf6100sm24286201cf.68.2024.09.16.00.49.22
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 00:49:22 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6c352bcb569so21157806d6.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 16 Sep 2024 00:49:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJPKQoVZUAEac3VVMcaFOLWyzWJ+n6pRtzqBq4g847sA8d12mVi9RxUMG+FSaraTp5ouv6mszbCJfdhZiMWw==@lists.sourceforge.net
X-Received: by 2002:a05:6214:3b84:b0:6c5:17cf:d9fc with SMTP id
 6a1803df08f44-6c5736ecb6dmr232219486d6.46.1726472962244; Mon, 16 Sep 2024
 00:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240914070300.42936-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20240914070300.42936-1-changhuang.liang@starfivetech.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Sep 2024 00:49:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBsBMogRYF3NH7qtZ0rDq+7wie8n_Dmyf6X_TfNJbcVw@mail.gmail.com>
Message-ID: <CAD=FV=XBsBMogRYF3NH7qtZ0rDq+7wie8n_Dmyf6X_TfNJbcVw@mail.gmail.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Sep 14, 2024 at 12:03 AM Changhuang Liang <changhuang.liang@starfivetech.com>
    wrote: > > Module kgdb had been converted to debug_core since commit c433820971ff
    > ("Move kernel/kgdb.c to kern [...] 
 
 Content analysis details:   (-1.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.172 listed in list.dnswl.org]
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sq6UJ-0007T5-FK
Subject: Re: [Kgdb-bugreport] [v1] Documentation: kgdb: Correct parameter
 error
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
 Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIFNlcCAxNCwgMjAyNCBhdCAxMjowM+KAr0FNIENoYW5naHVhbmcgTGlhbmcK
PGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBNb2R1bGUga2dk
YiBoYWQgYmVlbiBjb252ZXJ0ZWQgdG8gZGVidWdfY29yZSBzaW5jZSBjb21taXQgYzQzMzgyMDk3
MWZmCj4gKCJNb3ZlIGtlcm5lbC9rZ2RiLmMgdG8ga2VybmVsL2RlYnVnL2RlYnVnX2NvcmUuYyIp
IGJlIGFkZGVkLCBzbyBsZXQncwo+IGNvcnJlY3QgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgcGF0aC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3Rh
cmZpdmV0ZWNoLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva2dkYi5yc3Qg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
SSBndWVzcyB0aGlzIGNvdWxkIGhhdmUgYSAiRml4ZXMiIGJhc2VkIG9uIHRoZSBjb21taXQgbWVu
dGlvbmVkIGluIHRoZQpjb21taXQgbWVzc2FnZS4gUGF0Y2ggbG9va3MgcmlnaHQgdG8gbWU6CgpS
ZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVw
b3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
