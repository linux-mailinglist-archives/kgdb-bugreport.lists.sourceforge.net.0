Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC2E9F9BCD
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 Dec 2024 22:19:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tOkOw-0007o5-GS
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 20 Dec 2024 21:19:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tOkOv-0007nx-9e
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 20 Dec 2024 21:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZIaG92feVxOGmpMQB5rwsgi3dYuJr+7IPjHo49hkn3s=; b=LeEWRH1EbFdvYjGRhzFxTEG8GW
 W8GUBoRKc+rrIWFQzojb5/FPehUy7NU4gOjHdy7pWAfK2cWexjBvMd5J6UW/LjNoPqvq0V6TmLJdD
 mydR1SP5nTkyhfWC1rQgZEPjhKmXiFlH9sXzC1EQKt4Djj7+lzbnWb5rPDDLDR1F+mgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZIaG92feVxOGmpMQB5rwsgi3dYuJr+7IPjHo49hkn3s=; b=CvsO+n+ttNvsolDte4AGZK6Otq
 E7O/cqkISyJdjJErlEntgfTicmOKrTLGV8Pv17ScJ7hPsJZqioEfzKsbS/O9h9HWAYc7B/PQvsN5N
 IT2+rQPti4kBNjNrGtv85oKdYeV0+wDNskWP8yWMfZxxPwDFapemj+ySdfTPq5xpieLE=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tOkOt-0000Qr-PG for kgdb-bugreport@lists.sourceforge.net;
 Fri, 20 Dec 2024 21:19:12 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so1957679e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 20 Dec 2024 13:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734729544; x=1735334344;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZIaG92feVxOGmpMQB5rwsgi3dYuJr+7IPjHo49hkn3s=;
 b=bDjkhmirFJKpWTL9raCQwZMUu1oKcTgf2HW9Iv07XF/rbdAiEQfUePzIP5pDWUDDxS
 eBs+Z8HnaphqDHu26ZrNDz30ClZPPqiVM7TjnCewvtpIw5+5GLfRS1AyOEc/lw/iOTfl
 3eSXNYK1sbDTzi/uYjD7C19yKUtR/UjV+VETo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734729544; x=1735334344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIaG92feVxOGmpMQB5rwsgi3dYuJr+7IPjHo49hkn3s=;
 b=U3EVFoBK077oWGFqKjzLsQCUaZ9mvhaeVDosgIl/uHZ5vfVnLx0BEeY0oiDpAuZxMQ
 dj45PQG0TzVnfUlKQDfvd1yG0Y6qpr4tDIvT7U/ePhV/9aKoiXI+onj7GbBUCm7Cx4cO
 WvYkURZBHeuxWNa0BicpuONrLev8aQOvJ5N5PlZ57i3GvcMqL6OyjHJ3irTaaAqcl43n
 9MrinshEV2FReXd4m8odVsd0LRDa05F5Mitzp0M7cYCQVrkW+Z1SNWG1//EOFXMM9Dh9
 y/s+VNtDEoZ3dXbc9q5qXVuw6G6ehLREs2skHfX5b4T9gRLHGi1Pxx2vCp6JtunxgzHb
 kfIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFPmkYmos3qCy+EBjhizT761Ry05lrvKdE77sNZeBuLn8i+voCM5z8f7HJcsMbnL75XinLiJTc0Mj6dDiFkQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz06su6CZ8tyXhOihKGN0C7F+kHF0vVFTGutRVoenMJybhMnbho
 S0wRA/d0WhXY8lMYYzeV3zwhVrnn/ejX7qKA4C2sJQcskED0qwMfanguhalU9f/H1mnE24fa27E
 7fQ==
X-Gm-Gg: ASbGncsHYgbcjQlzyeuHhx8rbvKqtkTSJczxe17OWH9sF4WbKTwlfWfV0x+XbrClHWc
 b+MLQGdRe4QjdHzz2lCc3WdkhuewGQXQgIPCxYTSLUJDxU2IraveFNb1V6AcAOzHD1v7Lbu/pyk
 vtAMNyO6gHr8gzZxR/hLZbk05PTRphEBeW5z+julwnTWUUelN7mrqX2lV/vqGs+Jwqq+exeU5hN
 4pMZLWwnfcpXigBLvLVe6wrxUlSM8PemGHKMj51kxIfD+UH4u2PmY+bRVGYqfznxsbSCNQ5052g
 mLA4jvDJeNm3ugTmH2tP
X-Google-Smtp-Source: AGHT+IGAnPSzHHRdw3lueBM00vWggq/GNkKomhAIWRmyOwl/vDYzW3yignjvxhuxUM29rz8Ao0x3Yw==
X-Received: by 2002:a05:6512:3b90:b0:53e:3a73:d05a with SMTP id
 2adb3069b0e04-5422957ae58mr1402359e87.55.1734729544016; 
 Fri, 20 Dec 2024 13:19:04 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238138fbsm561421e87.159.2024.12.20.13.19.01
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 13:19:01 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so2394665e87.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 20 Dec 2024 13:19:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPixvdvb7pPsWsGfKveKXUzkCgvGEONSc6Y3biLvOizLBX5se6fmsjFYp+JlLu+pSNKPMBjNKiFCB+yxvJSA==@lists.sourceforge.net
X-Received: by 2002:a05:6512:10cc:b0:53d:f177:51c2 with SMTP id
 2adb3069b0e04-542295246famr1461651e87.11.1734729541541; Fri, 20 Dec 2024
 13:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20241220102512.296515-1-zhangheng@kylinos.cn>
In-Reply-To: <20241220102512.296515-1-zhangheng@kylinos.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Dec 2024 13:18:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UT0SHrNSLHgBJXjajoWLvdSNtSV1kGdsbDxfc_m_FBjQ@mail.gmail.com>
X-Gm-Features: AbW1kvYE__1yjWM_vRjBmJ5Ht6-c8uCdoJ6CRisHYl8BYJMY9grpMv3yCv6E9To
Message-ID: <CAD=FV=UT0SHrNSLHgBJXjajoWLvdSNtSV1kGdsbDxfc_m_FBjQ@mail.gmail.com>
To: zhangheng <zhangheng@kylinos.cn>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Dec 20, 2024 at 2:25 AM zhangheng <zhangheng@kylinos.cn>
    wrote: > > Use kmap_local_page() instead of kmap_atomic() which has been
   deprecated. > > Signed-off-by: zhangheng <zhangheng@kylinos. [...] 
 
 Content analysis details:   (-1.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.52 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.167.52 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.52 listed in list.dnswl.org]
 -1.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.52 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tOkOt-0000Qr-PG
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: use kmap_local_page()
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
Cc: kgdb-bugreport@lists.sourceforge.net, danielt@kernel.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIERlYyAyMCwgMjAyNCBhdCAyOjI14oCvQU0gemhhbmdoZW5nIDx6aGFuZ2hl
bmdAa3lsaW5vcy5jbj4gd3JvdGU6Cj4KPiBVc2Uga21hcF9sb2NhbF9wYWdlKCkgaW5zdGVhZCBv
ZiBrbWFwX2F0b21pYygpIHdoaWNoIGhhcyBiZWVuIGRlcHJlY2F0ZWQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiB6aGFuZ2hlbmcgPHpoYW5naGVuZ0BreWxpbm9zLmNuPgoKbml0OiBUaGUgZmFjdCB0aGF0
IHRoZSAibmFtZSIgcGFydCBvZiB0aGlzIGlzIGluIGFsbCBsb3dlcmNhc2UgYW5kCm1hdGNoZXMg
eW91ciBlbWFpbCBhZGRyZXNzIG1ha2VzIG1lIHRoaW5rIHlvdSdyZSBsYWNraW5nIHRoZSAibmFt
ZSIKcGFydCBvZiB5b3VyIGdpdCBjb25maWcuIElzICJ6aGFuZ2hlbmciIGhvdyB5b3Ugbm9ybWFs
bHkgaWRlbnRpZnkKeW91cnNlbGYsIG9yIHNob3VsZCB0aGVyZSBiZSBzcGFjZXMgLyBjYXBpdGFs
aXphdGlvbj8gQW4gSW50ZXJuZXQKc2VhcmNoIG1ha2VzIG1lIHRoaW5rIG1heWJlIHRoaXMgc2hv
dWxkIGJlICJaaGFuZyBIZW5nIiA/Cgo+IC0tLQo+ICBrZXJuZWwvZGVidWcva2RiL2tkYl9zdXBw
b3J0LmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKSSB3YXNuJ3QgdXAgb24gdGhlIHdob2xlIGttYXBfYXRvbWljKCkgZGVwcmVj
YXRpb24sIGJ1dCBMV04gdG8gdGhlCnJlc2N1ZSBbMV0uIFdpdGggdGhhdCBjb250ZXh0LCB0aGlz
IGxvb2tzIGZpbmUgdG8gbWUuCgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRl
cnNAY2hyb21pdW0ub3JnPgoKWzFdIGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy84MzYxNDQvCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
